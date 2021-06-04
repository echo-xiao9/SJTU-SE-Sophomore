package com.reins.bookstore.daoimpl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.reins.bookstore.dao.OrderDao;
import com.reins.bookstore.repository.OrderRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.reins.bookstore.entity.Order;

import java.util.ArrayList;
import java.util.Iterator;
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

    @Override
    public ArrayList getAdminOrder() {
        List<Order> result = orderRepository.getOrders();
        System.out.println(result);
        Iterator<Order> it = result.iterator();
        ArrayList<JSONArray> ordersJson = new ArrayList<JSONArray>();
        while (it.hasNext()) {
            Order order = (Order) it.next();
            ArrayList<String> arrayList = new ArrayList<String>();
            arrayList.add(order.getOrderId().toString());
            arrayList.add(order.getUser_id().toString());
            arrayList.add(order.getOrder_price().toString());
            ordersJson.add((JSONArray) JSONArray.toJSON(arrayList));
        }
        String  ordersString = JSON.toJSONString(ordersJson, SerializerFeature.BrowserCompatible);
        return ordersJson;
    }

}
