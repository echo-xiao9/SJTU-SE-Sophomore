package com.reins.bookstore.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "cart")
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer","fieldHandler"})
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,property = "cartId")
public class Cart {
    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE,generator="cart_id")
    @Column(name = "cart_id")
    private Integer cartId;
    private String name;
    private String author;
    private Integer price;
    private Integer number;
    private Integer bookId;
    private Integer userId;


    public Cart(String name, String author, Integer price, Integer number) {
        this.name = name;
        this.author = author;
        this.price = price;
        this.number = number;
    }

    public Cart() {
    }

    public Cart(String name, String author, Integer price, Integer number, Integer bookId) {

        this.name = name;
        this.author = author;
        this.price = price;
        this.number = number;
        this.bookId = bookId;
    }

    public Cart(String name, String author, Integer price, Integer number, Integer bookId, Integer userId) {
        this.name = name;
        this.author = author;
        this.price = price;
        this.number = number;
        this.bookId = bookId;
        this.userId = userId;
    }

    public Integer getCartId() {
        return cartId;
    }

    public String getName() {
        return name;
    }

    public String getAuthor() {
        return author;
    }

    public Integer getPrice() {
        return price;
    }

    public Integer getNumber() {
        return number;
    }

    public Integer getBookId() {
        return bookId;
    }
}
