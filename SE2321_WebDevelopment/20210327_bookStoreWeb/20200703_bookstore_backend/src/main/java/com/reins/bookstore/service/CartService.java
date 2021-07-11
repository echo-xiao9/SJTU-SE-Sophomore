package com.reins.bookstore.service;

import com.reins.bookstore.entity.Cart;

import java.util.List;

public interface CartService {
    List<Cart> getCart();

    List<Cart> clearCart();

    Cart addToCart(String name, String author, Integer price, Integer number,Integer bookId, Integer userId);

    List<Cart> getUserCart(Integer userId);
}
