package com.reins.bookstore.entity;

public class HotSelling {
    private String name;
    private Integer num;


    public HotSelling(String name, Integer num) {
        this.name = name;
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public Integer getNum() {
        return num;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}
