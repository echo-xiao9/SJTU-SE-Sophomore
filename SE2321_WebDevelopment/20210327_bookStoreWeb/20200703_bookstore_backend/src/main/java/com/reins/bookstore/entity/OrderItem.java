package com.reins.bookstore.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.reins.bookstore.repository.BookRepository;
import com.sun.istack.NotNull;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;


@Data
@Entity
@Table(name = "order_items")
//@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer","fieldHandler"})
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,property = "itemId")
public class OrderItem {

    @Id
    @Column(name = "item_id")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer itemId;


    @ManyToOne(cascade = {CascadeType.REFRESH,CascadeType.PERSIST, CascadeType.MERGE},fetch = FetchType.LAZY)
    @JsonIgnoreProperties(ignoreUnknown = true, value = {"orderItemList"})
    @JoinColumn(name = "order_id")
    @JSONField(serialize = false)
    private Order order;

    @ManyToOne
    @JoinColumn(name = "book_id")
    @NotNull
    @JsonIgnoreProperties(ignoreUnknown = true, value = {"orderItemList"})
    private Book book;

    private Integer book_num;

    public Integer getBook_num() {
        return book_num;
    }

    public Book getBook(){
        return book;
    }

    public OrderItem(Order order, Book book, Integer book_num) {
        this.order = order;
        this.book = book;
        this.book_num = book_num;
    }

    public OrderItem() {
    }



}
