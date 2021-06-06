package com.reins.bookstore.repository;

import com.reins.bookstore.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface CartRepository extends JpaRepository<Cart, Integer> {
    @Query("select c from Cart c")
    List<Cart> getCart();
    @Transactional
    void deleteByName(String name);
}
