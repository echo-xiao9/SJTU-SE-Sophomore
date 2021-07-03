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
                          bookId) {
        Cart cart = cartRepository.getCartByName(name);
//        System.out.println(cart);

            if (cart == null) {
                Cart c = new Cart(name, author, price, number,bookId);
                System.out.println("new cart");
                System.out.println(c);
                cartRepository.save(c);
                return c;
            }
            else {
                Cart c = cartRepository.getCartByName(name);
                Integer num = c.getNumber() + 1;
                cartRepository.deleteByName(c.getName());
                Cart c2 = new Cart(name, author, price, num,bookId);
                cartRepository.save(c2);
                return c2;
            }
        }
}