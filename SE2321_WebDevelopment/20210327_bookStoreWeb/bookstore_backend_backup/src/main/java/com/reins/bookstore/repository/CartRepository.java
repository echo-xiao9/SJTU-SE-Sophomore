package com.reins.bookstore.repository;

import com.reins.bookstore.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface CartRepository extends JpaRepository<Cart, Integer> {
    @Query("select c from Cart c")
    List<Cart> getCart();
    @Transactional
    void deleteByName(String name);


    @Modifying
    @Query("update Cart c set c.number=:number where c.name=:name")
    void updateCartNumber(@Param("number") Integer number ,@Param("name") String name);


    @Query("select p from Cart p where  p.name=:name")
    Cart getCartByName(@Param("name") String name);

}
