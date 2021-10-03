package com.reins.bookstore.entity;

public class OrderItemMsg {
    Integer order_id;
    Integer book_id;
    Integer book_num;

    public OrderItemMsg(Integer order_id, Integer book_id, Integer book_num) {
        this.order_id = order_id;
        this.book_id = book_id;
        this.book_num = book_num;
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

    public OrderItemMsg() {

    }
}
