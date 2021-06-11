package com.reins.bookstore.service;

import com.reins.bookstore.entity.User;
import com.reins.bookstore.entity.UserAuth;

import java.util.ArrayList;
import java.util.List;


public interface UserService {

    UserAuth checkUser(String username, String password);

    ArrayList getAdminUser();

    List<User> getUsers();


    User adminUserChange(Integer user_id, String name, String nickname, String tel, String address, Integer type);

    UserAuth adminUserAuthChange(String name, Integer type);
}
