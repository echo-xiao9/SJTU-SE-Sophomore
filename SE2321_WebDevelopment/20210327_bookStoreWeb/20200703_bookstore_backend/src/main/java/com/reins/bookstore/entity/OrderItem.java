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


    @ManyToOne
    @JsonIgnoreProperties(ignoreUnknown = true, value = {"orderItemList"})
    @JoinColumn(name = "order_id")
    @JSONField(serialize = false)
//    private Integer order_id;
    private Order order;

    @ManyToOne
    @JoinColumn(name = "book_id")
    @NotNull
    @JsonIgnoreProperties(ignoreUnknown = true, value = {"orderItemList"})
    private Book book;

    private Integer book_num;

    public Integer getItemId() {
        return itemId;
    }

    public Integer getBook_id() {
        return book.getBookId();
    }

    public Integer getBook_num() {
        return book_num;
    }

    public Book getBook(){
        return book;
    }


    public OrderItem(Integer order_id, Integer book_id, Integer book_num, String book_name, Integer book_price) {
//        this.order_id = order_id;
//        this.book_id = book_id;
//        this.book_num = book_num;
//        this.book_name = book_name;
//        this.book_price = book_price;
    }

    public OrderItem() {
    }



}
