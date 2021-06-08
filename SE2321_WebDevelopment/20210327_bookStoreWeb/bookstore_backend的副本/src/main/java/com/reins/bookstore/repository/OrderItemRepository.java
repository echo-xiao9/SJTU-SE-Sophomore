package com.reins.bookstore.repository;

import com.reins.bookstore.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderItemRepository extends JpaRepository<OrderItem,Integer> {
    @Query("select i from OrderItem i")
    List<OrderItem> getOrderItems();

    @Query(value = "SELECT i FROM OrderItem i where i.orderId = :order_id")
    List<OrderItem> getOrderItemsByOrderId(Integer order_id);
}
