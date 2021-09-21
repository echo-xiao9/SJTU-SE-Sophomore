package com.reins.bookstore.controller;

import com.reins.bookstore.entity.Cart;
import com.reins.bookstore.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController
//@Scope("prototype")
@Scope("session")
public class CartController {
    @Autowired
    WebApplicationContext applicationContext;

    @Autowired
    private CartService cartService;

    @GetMapping("/getCart")
    public List<Cart> getCart(){
        return cartService.getCart();
    }

    @GetMapping("/getUserCart")
        public List<Cart> getUserCart(
                @RequestParam("userId") Integer userId
    ){
        return cartService.getUserCart(userId);
    }


    @GetMapping("/clearCart")
    public List<Cart> clearCart(){
        return cartService.clearCart();
    }


    @GetMapping("/addToCart")
    public Cart addToCart(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String author,
            @RequestParam(required = false) Integer price,
            @RequestParam(required = false) Integer number,
            @RequestParam(required = false) Integer bookId,
            @RequestParam(required = false) Integer userId
            ){
        CartService cartService = applicationContext.getBean(CartService.class);
        System.out.println(cartService);
        System.out.println(this);
        return cartService.addToCart(name, author,price, number,bookId,userId);
    }


}
