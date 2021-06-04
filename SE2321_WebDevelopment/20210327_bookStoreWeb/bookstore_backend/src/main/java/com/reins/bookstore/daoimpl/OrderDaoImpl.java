package com.reins.bookstore.daoimpl;

import com.reins.bookstore.dao.OrderDao;
import com.reins.bookstore.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.reins.bookstore.entity.Order;

import java.util.List;
@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired
    private OrderRepository orderRepository;

    @Override
    public Order findOne(Integer id){
        return orderRepository.getOne(id);
    }

    @Override
    public List<Order> getOrders() {
        return orderRepository.getOrders();
    }

    @Override
    public Order addOrderFromUser(Integer user_id, Integer order_price) {
        Order order= new Order(user_id, order_price);
        orderRepository.save(order);
        return order;
    }

}
