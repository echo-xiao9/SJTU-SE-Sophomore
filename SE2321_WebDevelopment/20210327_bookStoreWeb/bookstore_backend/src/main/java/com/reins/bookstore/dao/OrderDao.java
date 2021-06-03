package com.reins.bookstore.dao;
import com.reins.bookstore.entity.Order;
import java.util.List;

public interface OrderDao {
    Order findOne(Integer id);

    List<Order> getOrders();
}
