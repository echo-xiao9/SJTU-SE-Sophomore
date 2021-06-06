package com.reins.bookstore.dao;

import com.reins.bookstore.entity.User;
import com.reins.bookstore.entity.UserAuth;

import java.util.ArrayList;
import java.util.List;

public interface UserDao {

    List<User> getUsers();
    UserAuth checkUser(String username, String password);

    ArrayList getAdminUser();

}
