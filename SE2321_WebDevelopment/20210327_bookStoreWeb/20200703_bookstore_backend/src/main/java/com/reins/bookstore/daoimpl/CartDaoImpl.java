package com.reins.bookstore.daoimpl;

import com.alibaba.fastjson.JSONArray;
import com.reins.bookstore.dao.CartDao;
import com.reins.bookstore.entity.Cart;
import com.reins.bookstore.repository.CartRepository;
import com.reins.bookstore.utils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class CartDaoImpl implements CartDao {
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    RedisUtil redisUtil;

//    @Override
//    public List<Cart> getCart() {
//        return cartRepository.getCart();
//    }

    @Override
    public List<Cart> getUserCart(Integer userId) {
        List<Cart> userCart = new ArrayList<Cart>();
        Object uc=redisUtil.get("userCart"+userId);
        if(uc==null){
            userCart = cartRepository.findByUserId(userId);
            redisUtil.set("userCart"+userId, JSONArray.toJSON(userCart));
        }else{
            userCart = JSONArray.parseArray(uc.toString(),Cart.class);
        }
        return userCart;
    }

    @Override
    public Cart deleteCartItem(Integer cartId) {
        Optional<Cart>  c=cartRepository.findById(cartId);
        if(c.isPresent()) {
           // clear cache of userCart
            List<Cart> userCart = new ArrayList<Cart>();
            Object uc=redisUtil.get("userCart"+c.get().getUserId());
            if(uc!= null){
                userCart = JSONArray.parseArray(uc.toString(),Cart.class);
                for(Cart item: userCart){
                    if(cartId.equals(item.getCartId())){
                        userCart.remove(item);
                        redisUtil.set("userCart"+c.get().getUserId(),JSONArray.toJSON(userCart));
                        if(userCart.size()==0)break;
                    }
                }
            }
            cartRepository.deleteById(cartId);
            return c.get();
        }
        return null;
    }

    @Override
    @Transactional(propagation= Propagation.SUPPORTS)
    public List<Cart> clearCart(Integer userId) {
        List<Cart> userCartList = getUserCart(userId);
        redisUtil.del("userCart"+userId);
        for(Cart c:userCartList){
            cartRepository.deleteById(c.getCartId());
        }
        return userCartList;
    }

    @Override
    public Cart addToCart(String name, String author,  Integer price, Integer number, Integer
            bookId,Integer userId) {
        Cart cart = cartRepository.getCartByName(name);
        if (cart == null) {
            cart = new Cart(name, author, price, number,bookId,userId);
        }
        else {
            cart.setNumber(cart.getNumber() + 1);
        }
        // refresh cache
        List<Cart> userCart = new ArrayList<Cart>();
        Object uc=redisUtil.get("userCart"+userId);
        if(uc!= null) {
            userCart = JSONArray.parseArray(uc.toString(), Cart.class);
            userCart.add(cart);
            redisUtil.set("userCart"+userId,JSONArray.toJSON(userCart));
        }
        // refresh db
        cartRepository.save(cart);
        return cart;
    }

}