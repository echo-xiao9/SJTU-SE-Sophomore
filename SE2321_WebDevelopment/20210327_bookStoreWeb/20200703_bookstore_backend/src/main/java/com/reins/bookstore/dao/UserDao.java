package com.reins.bookstore.dao;

import com.reins.bookstore.entity.User;
import com.reins.bookstore.entity.UserAuth;

import java.util.ArrayList;
import java.util.List;

public interface UserDao {

    List<User> getUsers();
    UserAuth checkUser(String username, String password);

    ArrayList getAdminUser();

    UserAuth adminUserAuthChange(Integer userId, Integer type);

    User getUserByName(String username);

    User addUser(String username, String password, String email);

    User adminUserChange(Integer user_id, String name, String email, Integer type);
}
