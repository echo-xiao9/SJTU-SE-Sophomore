package com.reins.bookstore.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.Data;

import javax.persistence.*;

/**
 * @ClassName User
 * @Description Entity of User
 * @Author thunderBoy
 * @Date 2019/11/7 12:46
 */
@Data
@Entity
@Table(name = "user")
@JsonIgnoreProperties(value = {"handler","hibernateLazyInitializer","fieldHandler"})
public class User {
    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE,generator="user_id")
    private Integer userId;
    private String nickname;
    private String name;
    private String tel;
    private String address;
    private Integer type;

    public Integer getUserId() {
        return userId;
    }

    public String getNickname() {
        return nickname;
    }

    public String getName() {
        return name;
    }

    public String getTel() {
        return tel;
    }

    public String getAddress() {
        return address;
    }

    public Integer getType() {
        return type;
    }

    public User(String nickname, String name, String tel, String address, Integer type) {
        this.nickname = nickname;
        this.name = name;
        this.tel = tel;
        this.address = address;
        this.type = type;
    }

    public User() {
    }
}


