package com.example.rootweblearning1.bean;


import lombok.Data;


import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@Entity
public class Userinfo {
    @Id
    private Long id;
    private String username;
    private String password;
    private String userRole;
}
