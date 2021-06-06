package com.reins.bookstore.controller;

import com.reins.bookstore.entity.Order;
import com.reins.bookstore.entity.OrderItem;
import com.reins.bookstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class OrderController {
    @Autowired
    private OrderService orderService;
    @GetMapping("/getOrders")
    public List<Order> getOrders() {
        return orderService.getOrders();
    }

//    @GetMapping("/getOrderItems")
//    public List<OrderItem>getOrderItems(){
//        return orderService.getOrderItems();
//    }


    @GetMapping("/addOrderFromUser")
    public Order addOrderFromUser (@RequestParam(required = false) Integer user_id,
                                   @RequestParam (required = false) Integer order_price,
                                   @RequestParam(required = false)String date,
                                   @RequestParam(required = false)String year,
                                   @RequestParam(required = false)String month,
                                   @RequestParam(required = false)String day
    ) {
        System.out.println("addOrder");
        return orderService.addOrderFromUser(user_id, order_price,date, year, month, day);
    }

    @GetMapping("/adminOrder")
    public ArrayList getAdminOrder(){
        return orderService.getAdminOrder();
    }

}
