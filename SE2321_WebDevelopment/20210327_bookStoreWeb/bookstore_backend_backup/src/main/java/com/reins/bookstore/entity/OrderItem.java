package com.reins.bookstore.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.Data;

import javax.persistence.*;


@Data
@Entity
@Table(name = "order_items")
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer","fieldHandler"})
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,property = "itemId")
public class OrderItem {

    @Id
    @Column(name = "itme_id")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer itemId;

    private Integer order_id;
    private Integer book_id;
    private Integer book_num;
    private String book_name;
    private Integer book_price;

    public Integer getItemId() {
        return itemId;
    }



    public Integer getOrder_id() {
        return order_id;
    }

    public Integer getBook_id() {
        return book_id;
    }

    public Integer getBook_num() {
        return book_num;
    }

    public String getBook_name() {
        return book_name;
    }

    public Integer getBook_price() {
        return book_price;
    }

    public OrderItem(Integer order_id, Integer book_id, Integer book_num, String book_name, Integer book_price) {
        this.order_id = order_id;
        this.book_id = book_id;
        this.book_num = book_num;
        this.book_name = book_name;
        this.book_price = book_price;
    }

    public OrderItem() {
    }



}
