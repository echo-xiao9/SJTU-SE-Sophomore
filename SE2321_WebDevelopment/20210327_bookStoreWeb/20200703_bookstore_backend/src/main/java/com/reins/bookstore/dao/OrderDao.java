package com.reins.bookstore.dao;
import com.reins.bookstore.entity.HotSelling;
import com.reins.bookstore.entity.Order;
import com.reins.bookstore.entity.OrderItem;
import com.reins.bookstore.entity.UserHotSelling;

import java.util.ArrayList;
import java.util.List;

public interface OrderDao {
    Order findOne(Integer id);

    List<Order> getOrders();

    Order addOrderFromUser(Integer user_id, Integer order_price, String date);

    OrderItem addOrderItem(Integer order_id, Integer book_id, Integer book_num);

    List<Order> getUserOrders(Integer user_id);

    List<Order> getUserBookOrders(Integer user_id, String bookName);

    List<Order> getUserDateOrder(Integer user_id, String from, String to);

    List<Order> getAdminBookOrders(String bookName);

    Object getAdminDateOrder(String from, String to);


//    ArrayList getAdminOrder();
//
//    Order addOrderFromUser(Integer user_id, Integer order_price, String date, String year, String month, String day);
//
//    List<OrderItem> getOrderItems(Integer order_id);
//
//    ArrayList getAdminAllOrder();

    List<HotSelling> getHotSelling(String from, String to);
//
//
List<HotSelling> getHotUsers(String from, String to);

    UserHotSelling getUserHotSelling(String from, String to, Integer user_id);

//    OrderItem addOrderItem(Integer order_id, Integer book_id, Integer book_num, String book_name, Integer book_price);
}
