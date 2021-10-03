package com.reins.bookstore.service;
import com.reins.bookstore.entity.HotSelling;
import com.reins.bookstore.entity.Order;
import com.reins.bookstore.entity.OrderItem;
import com.reins.bookstore.entity.UserHotSelling;
import org.aspectj.weaver.ast.Or;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

public interface OrderService {
    Order findOrderById(Integer id);

    Order addFullOrder(Order order);

    List<Order> getOrders();

    Order addOrderFromUser(Integer user_id, Integer order_price, String date);

    OrderItem addOrderItem(Integer order_id, Integer book_id, Integer book_num);

    OrderItem addOrderItem2(Order order, Integer book_id, Integer book_num);

    List<Order> getUserOrders(Integer user_id);

    List<Order> getUserBookOrders(Integer user_id, String bookName);

    List<Order> getUserDateOrder(Integer user_id, String from, String to);

    List<Order> getAdminBookOrders(String bookName);

    Object getAdminDateOrder(String from, String to);

    List<HotSelling>  getHotSelling(String from, String to);

    List<HotSelling> getHotUsers(String from, String to);

    UserHotSelling getUserHotSelling(String from, String to, Integer user_id);


    List<OrderItem> getOrderItems(Integer order_id);
}
