package com.reins.bookstore.serviceimpl;


import com.reins.bookstore.dao.OrderDao;

import com.reins.bookstore.entity.OrderItem;
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
        return orderDao.getOrders();
    }


    @Override
    public ArrayList getAdminOrder() {
        return orderDao.getAdminOrder();
    }

    @Override
    public Order addOrderFromUser(Integer user_id, Integer order_price, String date, String year, String month, String day) {
        return orderDao.addOrderFromUser( user_id,  order_price, date, year, month, day);
    }

    @Override
    public List<OrderItem> getOrderItems(Integer order_id) {
        return orderDao.getOrderItems(order_id);
    }

    @Override
    public ArrayList getAdminAllOrder() {
        return orderDao.getAdminAllOrder();
    }

}
