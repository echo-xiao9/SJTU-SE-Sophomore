package com.reins.bookstore.entity;


import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.annotation.*;
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
    @GeneratedValue(strategy= GenerationType.SEQUENCE,generator="id")
    @Column(name = "order_id")
    private Integer orderId;
    private Integer userId;
    private Integer order_price;

    @JsonIgnore
    @JSONField(serialize = false)
    @JsonIgnoreProperties(value = {"order"}, ignoreUnknown = true)
    @OneToMany(mappedBy = "order", cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY)
    private List<OrderItem> orderItemList;

    public Order(Integer user_id, Integer order_price, String date) {
        this.userId = user_id;
        this.order_price = order_price;
        this.date = date;

    }

    private String date;

    public Order() {
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setOrder_price(Integer order_price) {
        this.order_price = order_price;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public void setDate(String date) {
        this.date = date;
    }



}
