package com.reins.bookstore.controller;

import com.reins.bookstore.entity.Order;
import com.reins.bookstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class OrderController {
    @Autowired
    private OrderService orderService;
    @GetMapping("/getOrders")
    public List<Order> getOrders() {
        return orderService.getOrders();
    }


    @GetMapping("/addOrderFromUser")
    public Order addOrderFromUser (@RequestParam(required = false) Integer user_id,
                                                     @RequestParam (required = false) Integer order_price
    ) {
        System.out.println("addOrder");
        return orderService.addOrderFromUser(user_id, order_price);
    }

}
