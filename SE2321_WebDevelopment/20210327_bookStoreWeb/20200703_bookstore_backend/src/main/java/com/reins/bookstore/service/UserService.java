package com.reins.bookstore.service;

import com.reins.bookstore.entity.User;
import com.reins.bookstore.entity.UserAuth;

import java.util.ArrayList;
import java.util.List;


public interface UserService {

    UserAuth checkUser(String username, String password);

    ArrayList getAdminUser();

    List<User> getUsers();

    UserAuth adminUserAuthChange(Integer user_id, Integer type);

    User getUserByName(String username);

    User addUser(String username, String password, String email);

    User adminUserChange(Integer user_id, String name, String email, Integer type);
}
