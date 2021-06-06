package com.reins.bookstore.entity;


import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.Data;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

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

//    public  List<OrderItem> orderItems;

//    @OneToMany(cascade=CascadeType.ALL, orphanRemoval=true)
//    @JoinColumn(name="orderId")
//    public List<OrderItem> getOrderItems() { return orderItems; }

//    public void setOrderItems(List <OrderItem> inputOrderItems){
//        this.orderItems =  inputOrderItems;
//    }

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
