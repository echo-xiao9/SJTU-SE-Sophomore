package com.example.demo.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import javax.persistence.*;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int userId;
    private String username;
    private String password;
    private String userEmail;
    private String userAddress;
    private String userRole;

    public User(){

    }
    public User(String name, String password) {
        this.username = name;
        this.password = password;
    }
    public String toString() {
        return " id=''" + getUserId() + "'"+
                ", name='" + getUsername() + "'" +
                ", email='" + getUserEmail() + "'" +
                ", password='" + getUserPassword() + "'" +
                "}";
    }

    public int getUserId() {
        return this.userId;
    }
    public void setUserId(int id) { this.userId = id;}

    public String getUsername() {
        return this.username;
    }
    public void setUsername(String name) { this.username = name;}

    public String getUserEmail() {
        return this.userEmail;
    }
    public void setUserEmail(String email) { this.userEmail = email;}

    public String getUserPassword() {
        return this.password;
    }
    public void setUserPassword(String password) { this.password = password;}

    public String getUserRole() { return this.userRole; }
    public void setUserRole(String role) { this.userRole = role;}

}
