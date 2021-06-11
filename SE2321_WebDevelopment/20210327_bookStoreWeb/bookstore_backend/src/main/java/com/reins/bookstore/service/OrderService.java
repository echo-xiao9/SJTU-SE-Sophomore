package com.reins.bookstore.service;
import com.reins.bookstore.entity.Order;
import com.reins.bookstore.entity.OrderItem;

import java.util.ArrayList;
import java.util.List;

public interface OrderService {
    Order findOrderById(Integer id);

    List<Order> getOrders();

    ArrayList getAdminOrder();

    Order addOrderFromUser(Integer user_id, Integer order_price, String date, String year, String month, String day);

    List<OrderItem> getOrderItems(Integer order_id);

    ArrayList getAdminAllOrder();

//    ArrayList getAdminOrderItems();
}
