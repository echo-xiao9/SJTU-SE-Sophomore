package com.reins.bookstore.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.reins.bookstore.entity.*;
import com.reins.bookstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RestController
public class OrderController {
    @Autowired
    WebApplicationContext applicationContext;
    @Autowired
    private OrderService orderService;


    @GetMapping("/getOrders")
    public String getOrders() {
//        return orderService.getOrders();

        return JSON.toJSONString(orderService.getOrders(), SerializerFeature.DisableCircularReferenceDetect);
    }



    @GetMapping("/getUserOrders")
    public String getUserOrders(@RequestParam(required = false) Integer user_id){
        return JSON.toJSONString(orderService.getUserOrders(user_id), SerializerFeature.DisableCircularReferenceDetect);
    }

    @GetMapping("/getUserOrders1")
    public java.util.List<Order> getUserOrders1(@RequestParam(required = false) Integer user_id){
        return orderService.getUserOrders(user_id);
//        return JSON.toJSONString(orderService.getUserOrders(user_id), SerializerFeature.DisableCircularReferenceDetect);
    }
    @GetMapping("/getOrderItem")
    public List<OrderItem> getOrderItems(@RequestParam(required = false) Integer order_id){
        return orderService.getOrderItems(order_id);
    }

    @GetMapping("/getUserBookOrders")
    public String getUserBookOrders(@RequestParam(required = false)Integer user_id,
                                    @RequestParam(required = false)String bookName){
        return JSON.toJSONString(orderService.getUserBookOrders(user_id,bookName),SerializerFeature.DisableCircularReferenceDetect);
    }

    @GetMapping("/getAdminBookOrders")
    public String getAdminBookOrders(
                                    @RequestParam(required = false)String bookName){
        return JSON.toJSONString(orderService.getAdminBookOrders(bookName),SerializerFeature.DisableCircularReferenceDetect);
    }


    @GetMapping("/getUserDateOrder")
    public String getUserDateOrder(@RequestParam(required = false)Integer user_id,
                                    @RequestParam(required = false)String from,
                                    @RequestParam(required = false)String to
    ){
        return JSON.toJSONString(orderService.getUserDateOrder(user_id,from,to),SerializerFeature.DisableCircularReferenceDetect);
    }

    @GetMapping("/getAdminDateOrder")
    public String getAdminDateOrder(
                                   @RequestParam(required = false)String from,
                                   @RequestParam(required = false)String to
    ){
        return JSON.toJSONString(orderService.getAdminDateOrder(from,to),SerializerFeature.DisableCircularReferenceDetect);
    }

    @GetMapping("/addOrderFromUser")
    public Order addOrderFromUser (@RequestParam(required = false) Integer user_id,
                                   @RequestParam (required = false) Integer order_price,
                                   @RequestParam(required = false)String date
    ) {
        JmsTemplate jmsTemplate = applicationContext.getBean(JmsTemplate.class);
        System.out.println("Sending an order message.");
        Order order = new Order(user_id,order_price, date);
        jmsTemplate.convertAndSend("orderBox", new Order(user_id,order_price, date));
        return order;
    }


    @GetMapping("/addOrderItem")
    public OrderItem addOrderItem(
            @RequestParam(required = false)  Integer order_id,
            @RequestParam(required = false)  Integer book_id,
            @RequestParam(required = false)  Integer book_num

    ){
        return orderService.addOrderItem(order_id, book_id,book_num);
    }
// can be comment

    @GetMapping("/getHotSelling")
    public List<HotSelling>  getHotSelling(
            @RequestParam String from,
            @RequestParam String to
    ){
        return orderService.getHotSelling(from, to);
    }
//
    @GetMapping("/getHotUsers")
    public List<HotSelling> getHotUsers(
        @RequestParam String from,
        @RequestParam String to
    ){
        return orderService.getHotUsers(from, to);
    }
//
    @GetMapping("/getUserHotSelling")
    public UserHotSelling getUserHotSelling(
            @RequestParam String from,
            @RequestParam String to,
            @RequestParam Integer user_id
    ){
        return orderService.getUserHotSelling(from, to, user_id);
    }

}
