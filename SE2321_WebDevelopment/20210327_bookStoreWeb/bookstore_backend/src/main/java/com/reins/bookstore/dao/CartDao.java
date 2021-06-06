package com.reins.bookstore.dao;

import com.reins.bookstore.entity.Cart;

import java.util.List;

public interface CartDao {
    List<Cart> getCart();

    List<Cart> clearCart();
}
