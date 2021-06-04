package com.reins.bookstore.dao;
import com.reins.bookstore.entity.Order;
import java.util.ArrayList;
import java.util.List;

public interface OrderDao {
    Order findOne(Integer id);

    List<Order> getOrders();
    Order addOrderFromUser(Integer user_id, Integer order_price);

    ArrayList getAdminOrder();
}
