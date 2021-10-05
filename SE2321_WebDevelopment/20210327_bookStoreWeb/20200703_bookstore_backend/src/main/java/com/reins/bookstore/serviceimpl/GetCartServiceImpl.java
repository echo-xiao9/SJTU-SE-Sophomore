package com.reins.bookstore.serviceimpl;

import com.reins.bookstore.dao.CartDao;
import com.reins.bookstore.service.CartService;
import com.reins.bookstore.service.GetCartService;
import com.reins.bookstore.entity.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class GetCartServiceImpl implements GetCartService {
    @Autowired
    private CartDao cartDao;

//    @Override
//    public List<Cart> getCart() {
//        return cartDao.getCart();
//    }

    @Override
    public List<Cart> getUserCart(Integer userId) {
        return cartDao.getUserCart(userId);
    }

    @Override
    @Transactional(propagation= Propagation.SUPPORTS)
    public List<Cart> clearCart(Integer userId) {
        return cartDao.clearCart(userId);
    }

    @Override
    public Cart deleteCartItem(Integer cartId) {
        return cartDao.deleteCartItem(cartId);
    }

}
