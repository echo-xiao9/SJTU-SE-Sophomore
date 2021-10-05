package com.reins.bookstore.dao;

import com.reins.bookstore.entity.Cart;

import java.util.List;

public interface CartDao {
//    List<Cart> getCart();

    List<Cart> clearCart(Integer userId);

    Cart addToCart(String name, String author,  Integer price,
                   Integer number, Integer bookId, Integer userId);

    List<Cart> getUserCart(Integer userId);

    Cart deleteCartItem(Integer cartId);
}
