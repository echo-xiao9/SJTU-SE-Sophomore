package com.reins.bookstore.entity;


import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "orders")
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer","fieldHandler"})
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,property = "orderId")
public class Order {
    @Id
    @Column(name = "id")
    private Integer orderId;
    private Integer user_id;
    private Integer order_price;

    public Order(Integer user_id, Integer order_price) {
        this.user_id = user_id;
        this.order_price = order_price;
    }

    public Order(Integer orderId, Integer user_id, Integer order_price) {
        this.orderId = orderId;
        this.user_id = user_id;
        this.order_price = order_price;
    }

    public Order() {
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                '}';
    }

}
