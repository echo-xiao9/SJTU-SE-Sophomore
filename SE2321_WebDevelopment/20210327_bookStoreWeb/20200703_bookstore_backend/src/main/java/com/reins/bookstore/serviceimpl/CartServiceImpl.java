package com.reins.bookstore.serviceimpl;

import com.reins.bookstore.dao.CartDao;
import com.reins.bookstore.entity.Cart;
import com.reins.bookstore.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Scope("session")
public class CartServiceImpl implements CartService {
    @Autowired
    private CartDao cartDao;

//    @Override
//    public List<Cart> getCart() {
//        return cartDao.getCart();
//    }

    @Override
    public List<Cart> clearCart(Integer userId) {
        return cartDao.clearCart(userId);
    }

    @Override
    public Cart addToCart(String name, String author, Integer price, Integer number, Integer bookId, Integer userId) {
        return cartDao.addToCart(name, author,price, number, bookId, userId);
    }

    @Override
    public List<Cart> getUserCart(Integer userId) {
        return cartDao.getUserCart(userId);
    }
}



