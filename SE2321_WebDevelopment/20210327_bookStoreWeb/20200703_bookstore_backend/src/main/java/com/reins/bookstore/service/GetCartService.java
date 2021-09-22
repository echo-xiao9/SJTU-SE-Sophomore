package com.reins.bookstore.service;

import com.reins.bookstore.entity.Cart;

import java.util.List;

public interface GetCartService {
    List<Cart> getCart();
    public List<Cart> clearCart();
}
