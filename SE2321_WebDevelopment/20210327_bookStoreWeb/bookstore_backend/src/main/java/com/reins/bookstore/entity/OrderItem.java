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
    @Column(name = "item_id")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer itemId;

    @ManyToOne
    @JoinColumn(name="order_id")
    private Order order;

    private Integer bookId;
    private Integer book_num;
    private String book_name;
    private Integer book_price;

    public Integer getItemId() {
        return itemId;
    }

    public Order getOrder() {
        return order;
    }

    public Integer getBookId() {
        return bookId;
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

//    public Integer getOrder_id() {
//        return order_id;
//    }
}
