package com.reins.bookstore.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.*;
import com.reins.bookstore.repository.BookRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;


import javax.persistence.*;
import java.util.List;

/**
 * @ClassName Book
 * @Description Book Entity
 * @Author thunderBoy
 * @Date 2019/11/5 19:19
 */
@Data
@Entity
@Table(name = "book")
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer","fieldHandler"})
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,property = "bookId")
public class Book {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy= GenerationType.SEQUENCE,generator="id")
    private Integer bookId;
    private String isbn;
    private String name;
    private String type;
    private String author;
    private Integer price;
    private String description;
    private Integer inventory;
    private String image;

    @JsonIgnore
    @JSONField(serialize = false)
    @JsonIgnoreProperties(value = {"book"}, ignoreUnknown = true)
    @OneToMany(mappedBy = "book", cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY)
    private List<OrderItem> orderItemList;

    public Integer getBookId() {
        return bookId;
    }

    public String getIsbn() {
        return isbn;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public String getAuthor() {
        return author;
    }

    public Integer getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public Integer getInventory() {
        return inventory;
    }

    public String getImage() {
        return image;
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public Book(String isbn, String name, String type, String author, Integer price, String description, Integer inventory, String image) {
        this.isbn = isbn;
        this.name = name;
        this.type = type;
        this.author = author;
        this.price = price;
        this.description = description;
        this.inventory = inventory;
        this.image = image;
    }

    public Book(String name,Integer inventory, Integer bookId,Integer price) {
        this.bookId = bookId;
    }

    public Book() {
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }
}
