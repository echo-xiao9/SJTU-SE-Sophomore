package com.reins.bookstore.dao;
import com.reins.bookstore.entity.Order;
import com.reins.bookstore.entity.OrderItem;

import java.util.ArrayList;
import java.util.List;

public interface OrderDao {
    Order findOne(Integer id);

    List<Order> getOrders();


    ArrayList getAdminOrder();

    Order addOrderFromUser(Integer user_id, Integer order_price, String date, String year, String month, String day);

    List<OrderItem> getOrderItems(Integer order_id);

    ArrayList getAdminAllOrder();

    ArrayList getHotSelling(String from, String to);


    ArrayList getHotUsers(String from, String to);

    ArrayList getUserHotSelling(String from, String to, Integer user_id);

    OrderItem addOrderItem(Integer order_id, Integer book_id, Integer book_num, String book_name, Integer book_price);
}
