package com.reins.bookstore.serviceimpl;


import com.reins.bookstore.dao.OrderDao;

import com.reins.bookstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.reins.bookstore.entity.Order;
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
}
