package com.reins.bookstore.serviceimpl;
import com.reins.bookstore.dao.BookDao;
import com.reins.bookstore.dao.OrderDao;

import com.reins.bookstore.entity.*;
import com.reins.bookstore.service.GetCartService;
import com.reins.bookstore.service.OrderService;
import com.reins.bookstore.service.UserService;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;


import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Service
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private BookDao bookDao;
    @Autowired
    private GetCartService getCartService;
    @Autowired
    UserService userService;



    @Override
    public Order findOrderById(Integer id){
        return orderDao.findOne(id);
    }

    @Override
    public List<Order> getOrders() {
        List<Order> orderList=orderDao.getOrders();
        return orderList;
    }

    @Override
    @Transactional(propagation=Propagation.MANDATORY)
    public Order addOrderFromUser(Integer user_id, Integer order_price, String date) {
        return orderDao.addOrderFromUser(user_id,order_price,date);
    }


    @Override
    @Transactional(propagation=Propagation.REQUIRED)
    public Order addFullOrder(Order order){
        Order order1=this.addOrderFromUser(order.getUserId(), order.getOrder_price(),order.getDate());
        User user = userService.getUserById(order.getUserId());
        List<Cart> cartList = getCartService.getCart();
        for(Cart c:cartList){
            System.out.println(order1.getOrderId()+" "+c.getBookId()+" "+ c.getNumber());
            OrderItem item = this.addOrderItem(order1.getOrderId(),c.getBookId(),c.getNumber());
        }
        getCartService.clearCart();
        if(!user.getUserId().equals(order.getOrderId())){
            System.out.println("the user is null");
            throw new RuntimeException("error");
        }
        System.out.println("Received order < order_id:"+order1.getOrderId() +" user_id:" +
                order1.getUserId()+" order_price:"+order1.getOrder_price() +" date:" +order1.getDate() + ">");
        Order fullOrder= orderDao.findOne(order1.getOrderId());
        return fullOrder;
    }


    @Override
    @Transactional(propagation=Propagation.REQUIRED)
    public OrderItem addOrderItem(Integer order_id, Integer book_id, Integer book_num) {
        OrderItem result = orderDao.addOrderItem(order_id,book_id,book_num);
        return result;
    }

    @Override
    public OrderItem addOrderItem2(Order order, Integer book_id, Integer book_num) {
        OrderItem result = orderDao.addOrderItem2(order,book_id,book_num);
        return result;
    }

    @Override
    public List<Order> getUserOrders(Integer user_id) {
        return orderDao.getUserOrders(user_id);
    }

    @Override
    public List<Order> getUserBookOrders(Integer user_id, String bookName) {
        return orderDao.getUserBookOrders(user_id,bookName);
    }

    @Override
    public List<Order> getAdminBookOrders(String bookName) {
        return orderDao.getAdminBookOrders(bookName);
    }

    @Override
    public List<Order> getUserDateOrder(Integer user_id, String from, String to) {
        return orderDao.getUserDateOrder(user_id,from,to);
    }

    @Override
    public Object getAdminDateOrder(String from, String to) {
        return orderDao.getAdminDateOrder(from,to);
    }

    @Override
    public List<HotSelling> getHotSelling(String from, String to) {
        return orderDao.getHotSelling(from, to);
    }

    @Override
    public List<HotSelling> getHotUsers(String from, String to) {
        return orderDao.getHotUsers(from,to);
    }

    @Override
    public UserHotSelling getUserHotSelling(String from, String to, Integer user_id) {
        return orderDao.getUserHotSelling(from,to,user_id);
    }

    @Override
    public List<OrderItem> getOrderItems(Integer order_id) {
        return orderDao.getOrderItems(order_id);
    }


}
