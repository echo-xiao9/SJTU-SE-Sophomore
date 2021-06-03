package com.reins.bookstore.service;
import com.reins.bookstore.entity.Order;
import java.util.List;

public interface OrderService {
    Order findOrderById(Integer id);

    List<Order> getOrders();
}
