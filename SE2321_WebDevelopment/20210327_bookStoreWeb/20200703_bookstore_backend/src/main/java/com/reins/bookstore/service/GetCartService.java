package com.reins.bookstore.service;

import com.reins.bookstore.entity.Cart;

import java.util.List;

public interface GetCartService {
    List<Cart> getUserCart(Integer userId);
    public List<Cart> clearCart(Integer userId);
    public Cart deleteCartItem(Integer cartId);
}
