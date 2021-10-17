package com.reins.bookstore.utils;

import com.reins.bookstore.entity.Cart;
import com.reins.bookstore.entity.Order;
import com.reins.bookstore.service.GetCartService;
import com.reins.bookstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@Component
public class OrderReceiver {
    @Autowired
    WebApplicationContext applicationContext;
    @Autowired
    private OrderService orderService;
    @Autowired
    private  GetCartService getCartService;

    @JmsListener(destination = "orderBox")//, containerFactory = "myFactory")
    public void receiveMessage(Order order) {
//        Order order1=orderService.addOrderFromUser(order.getUserId(), order.getOrder_price(),order.getDate());
//        List<Cart> cartList = getCartService.getCart();
//        for(Cart c:cartList){
//            System.out.println(order1.getOrderId()+" "+c.getBookId()+" "+ c.getNumber());
//            OrderItem item = orderService.addOrderItem(order1.getOrderId(),c.getBookId(),c.getNumber());
//        }
//        getCartService.clearCart();
//        System.out.println("Received order < order_id:"+order1.getOrderId() +" user_id:" +
//                order1.getUserId()+" order_price:"+order1.getOrder_price() +" date:" +order1.getDate() + ">");
//
        orderService.addFullOrder(order);


    }





}
