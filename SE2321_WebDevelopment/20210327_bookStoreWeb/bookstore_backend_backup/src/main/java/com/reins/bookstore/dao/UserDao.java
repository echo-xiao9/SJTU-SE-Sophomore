package com.reins.bookstore.dao;

import com.reins.bookstore.entity.User;
import com.reins.bookstore.entity.UserAuth;

import java.util.ArrayList;
import java.util.List;

public interface UserDao {

    List<User> getUsers();
    UserAuth checkUser(String username, String password);

    ArrayList getAdminUser();

    User adminUserChange(Integer user_id, String name, String nickname, String tel, String address, Integer type);

    UserAuth adminUserAuthChange(String name, Integer type);
}
