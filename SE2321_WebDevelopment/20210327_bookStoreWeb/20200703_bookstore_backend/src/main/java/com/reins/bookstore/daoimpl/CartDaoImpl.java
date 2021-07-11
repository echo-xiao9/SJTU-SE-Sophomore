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
        List<Cart> cartList = cartRepository.findAll();
        cartRepository.deleteAll();
        return cartList;
    }

    @Override
    public Cart addToCart(String name, String author,  Integer price, Integer number, Integer
                          bookId,Integer userId) {
        Cart cart = cartRepository.getCartByName(name);

            if (cart == null) {
                Cart c = new Cart(name, author, price, number,bookId,userId);
                cartRepository.save(c);
                return c;
            }
            else {
                cart.setNumber(cart.getNumber() + 1);
                cartRepository.save(cart);
                return cart;
            }
        }

    @Override
    public List<Cart> getUserCart(Integer userId) {
        return cartRepository.findByUserId(userId);
    }
}