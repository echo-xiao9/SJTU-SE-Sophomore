package com.reins.bookstore.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.reins.bookstore.entity.Order;
import com.reins.bookstore.entity.OrderItem;
import com.reins.bookstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderController {
    @Autowired
    private OrderService orderService;
    @GetMapping("/getOrders")
    public String getOrders() {
//        return orderService.getOrders();
        return JSON.toJSONString(orderService.getOrders(), SerializerFeature.DisableCircularReferenceDetect);
    }

    @GetMapping("/addOrderFromUser")
    public Order addOrderFromUser (@RequestParam(required = false) Integer user_id,
                                   @RequestParam (required = false) Integer order_price,
                                   @RequestParam(required = false)String date
    ) {
        System.out.println("addOrder");
        return orderService.addOrderFromUser(user_id, order_price,date);
    }
    @GetMapping("/addOrderItem")
    public OrderItem addOrderItem(
            @RequestParam(required = false)  Integer order_id,
            @RequestParam(required = false)  Integer book_id,
            @RequestParam(required = false)  Integer book_num

    ){
        return orderService.addOrderItem(order_id, book_id,book_num);
    }

//    @GetMapping("/adminOrder")
//    public ArrayList getAdminOrder(){
//        return orderService.getAdminOrder();
//    }
//
//    @GetMapping("/getAdminAllOrder")
//    public ArrayList getAdminAllOrder(){return orderService.getAdminAllOrder();}
//
//    @GetMapping("/getHotSelling")
//    public ArrayList getHotSelling(
//            @RequestParam String from,
//            @RequestParam String to
//    ){
//        return orderService.getHotSelling(from, to);
//    }
//
//    @GetMapping("/getHotUsers")
//    public ArrayList getHotUsers(
//        @RequestParam String from,
//        @RequestParam String to
//    ){
//        return orderService.getHotUsers(from, to);
//    }
//
//    @GetMapping("/getUserHotSelling")
//    public ArrayList getHotUsers(
//            @RequestParam String from,
//            @RequestParam String to,
//            @RequestParam Integer user_id
//
//    ){
//        return orderService.getUserHotSelling(from, to,user_id);
//    }


}
