package com.reins.bookstore.service;

import com.reins.bookstore.entity.Cart;

import java.util.List;

public interface CartService {
    List<Cart> getCart();

    List<Cart> clearCart();
}
