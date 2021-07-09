package com.reins.bookstore.serviceimpl;


import com.reins.bookstore.dao.OrderDao;

import com.reins.bookstore.entity.HotSelling;
import com.reins.bookstore.entity.OrderItem;
import com.reins.bookstore.entity.UserHotSelling;
import com.reins.bookstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.reins.bookstore.entity.Order;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

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
    public Order addOrderFromUser(Integer user_id, Integer order_price, String date) {
        return orderDao.addOrderFromUser(user_id,order_price,date);
    }

    @Override
    public OrderItem addOrderItem(Integer order_id, Integer book_id, Integer book_num) {
        return orderDao.addOrderItem(order_id,book_id,book_num);
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


//    @Override
//    public ArrayList getAdminOrder() {
//        return orderDao.getAdminOrder();
//    }
//
//    @Override
//    public Order addOrderFromUser(Integer user_id, Integer order_price, String date, String year, String month, String day) {
//        return orderDao.addOrderFromUser( user_id,  order_price, date, year, month, day);
//    }

//    @Override
//    public List<OrderItem> getOrderItems(Integer order_id) {
//        return orderDao.getOrderItems(order_id);
//    }
//
//    @Override
//    public ArrayList getAdminAllOrder() {
//        return orderDao.getAdminAllOrder();
//    }
//
    @Override
    public List<HotSelling> getHotSelling(String from, String to) {
        return orderDao.getHotSelling(from, to);
    }
//
    @Override
    public List<HotSelling> getHotUsers(String from, String to) {
        return orderDao.getHotUsers(from,to);
    }

    @Override
    public UserHotSelling getUserHotSelling(String from, String to, Integer user_id) {
        return orderDao.getUserHotSelling(from,to,user_id);
    }

//
//    @Override
//    public ArrayList getUserHotSelling(String from, String to, Integer user_id) {
//        return orderDao.getUserHotSelling(from,to,user_id);
//    }
//
//    @Override
//    public OrderItem addOrderItem(Integer order_id, Integer book_id, Integer book_num, String book_name, Integer book_price) {
//        return orderDao.addOrderItem(order_id,book_id, book_num, book_name, book_price);
//    }

}
