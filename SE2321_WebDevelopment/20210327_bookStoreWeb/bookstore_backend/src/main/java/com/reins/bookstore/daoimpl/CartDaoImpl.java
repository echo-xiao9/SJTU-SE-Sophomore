package com.reins.bookstore.daoimpl;

import com.reins.bookstore.dao.CartDao;
import com.reins.bookstore.entity.Cart;
import com.reins.bookstore.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartDaoImpl implements CartDao {
    @Autowired
    private CartRepository cartRepository;

    @Override
    public List<Cart> getCart() {
        return cartRepository.getCart();
    }

    @Override
    public List<Cart> clearCart() {
        List<Cart> cartList=cartRepository.getCart();
        for(int i=0;i<cartList.size();i++){
            String name=cartList.get(i).getName();
            cartRepository.deleteByName(name);
        }
        return cartList;
    }
}
