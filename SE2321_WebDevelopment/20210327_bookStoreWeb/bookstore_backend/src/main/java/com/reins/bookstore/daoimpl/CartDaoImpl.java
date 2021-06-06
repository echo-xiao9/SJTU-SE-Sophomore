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
        List<Cart> cartList = cartRepository.getCart();
        for (int i = 0; i < cartList.size(); i++) {
            String name = cartList.get(i).getName();

        }
        return cartList;
    }

    @Override
    public Cart addToCart(String name, String author, Integer price, Integer number) {
        Cart cart = cartRepository.getCartByName(name);
//        System.out.println(cart);

            if (cart == null) {
                System.out.println("before new!");
                Cart c = new Cart(name, author, price, number);
                cartRepository.save(c);
                return c;
            }
            else {
                System.out.println("before update!");
                Cart c = cartRepository.getCartByName(name);
                System.out.println(c);
                Integer num = c.getNumber() + 1;
                cartRepository.deleteByName(c.getName());
                Cart c2 = new Cart(name, author, price, num);
                cartRepository.save(c2);
                return c2;
//            cartRepository.updateCartNumber(c.getNumber(),name);
            }
//        Cart cart = new Cart(name, author,price, number);
//        cartRepository.save(cart);
//        return cart;
        }

}