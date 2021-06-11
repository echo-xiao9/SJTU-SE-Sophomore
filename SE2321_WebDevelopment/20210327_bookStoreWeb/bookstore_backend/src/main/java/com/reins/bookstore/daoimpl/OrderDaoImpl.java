package com.reins.bookstore.daoimpl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.reins.bookstore.dao.OrderDao;
import com.reins.bookstore.entity.OrderItem;
import com.reins.bookstore.repository.OrderItemRepository;
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
    @Autowired
    private OrderItemRepository orderItemRepository;

    @Override
    public Order findOne(Integer id){
        return orderRepository.getOne(id);
    }

    @Override
    public List<Order> getOrders() {
        return orderRepository.getOrders();
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
            arrayList.add(order.getUser_id().toString());
            arrayList.add(order.getOrder_price().toString());
            ordersJson.add((JSONArray) JSONArray.toJSON(arrayList));
        }
        String  ordersString = JSON.toJSONString(ordersJson, SerializerFeature.BrowserCompatible);
        return ordersJson;
    }

    @Override
    public Order addOrderFromUser(Integer user_id, Integer order_price, String date, String year, String month, String day) {
        Order order= new Order(user_id, order_price, date,year, month, day);
        orderRepository.save(order);
        return order;
    }

    @Override
    public List<OrderItem> getOrderItems(Integer order_id) {
        System.out.println("before get items");
        return orderItemRepository.getOrderItemsByOrderId(order_id);
    }
    public ArrayList getOrderItemsList(Integer order_id){
        List<OrderItem> orderItemList = getOrderItems(order_id);
        ArrayList<JSONArray> orderItemJson = new ArrayList<JSONArray>();
        Iterator<OrderItem> it= orderItemList.iterator();
        while (it.hasNext()) {
            OrderItem orderItem =(OrderItem) it.next();
            ArrayList<String> arrayList=new ArrayList<String>();
            arrayList.add(orderItem.getBook_id().toString());
            arrayList.add(orderItem.getBook_name());
            arrayList.add(orderItem.getBook_price().toString());
            arrayList.add(orderItem.getBook_num().toString());
            orderItemJson.add((JSONArray) JSONArray.toJSON(arrayList));
        }
        return orderItemJson;
    }


    @Override
    public ArrayList getAdminAllOrder() {
        List<Order> result = orderRepository.getOrders();
        System.out.println(result);
        Iterator<Order> it = result.iterator();
        ArrayList<JSONArray> ordersJson = new ArrayList<JSONArray>();
        while (it.hasNext()) {
            Order order = (Order) it.next();
            ArrayList<String> arrayList = new ArrayList<String>();
            arrayList.add(order.getOrder_price().toString());
            arrayList.add(order.getUser_id().toString());
            arrayList.add(order.getYear());
            arrayList.add(order.getMonth());
            arrayList.add(order.getDay());
            arrayList.add(order.getOrderId().toString());
//            arrayList.add(getOrderItems(order.getOrderId()).toString());
//            arrayList.add((JSONArray)JSONArray.toJSON(getOrderItemsList(order.getOrderId())));
            ordersJson.add((JSONArray) JSONArray.toJSON(arrayList));
        }
//        String  ordersString = JSON.toJSONString(ordersJson, SerializerFeature.BrowserCompatible);
        return ordersJson;
    }


}
