package com.reins.bookstore.serviceimpl;

import com.reins.bookstore.dao.UserDao;
import com.reins.bookstore.entity.User;
import com.reins.bookstore.entity.UserAuth;
import com.reins.bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName UserServiceImpl
 * @Description the implement of user service
 * @Author thunderBoy
 * @Date 2019/11/7 13:16
 */

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public UserAuth checkUser(String username, String password){
        return userDao.checkUser(username,password);

    }

    @Override
    public ArrayList getAdminUser() {
        return userDao.getAdminUser();
    }

    @Override
    public List<User> getUsers() {
        return userDao.getUsers();
    }


    @Override
    public UserAuth adminUserAuthChange(Integer userId, Integer type) {
        return userDao.adminUserAuthChange(userId,type);
    }

    @Override
    public User getUserByName(String username) {
        return userDao.getUserByName(username);
    }

    @Override
    public User addUser(String username, String password, String email) {
        return userDao.addUser(username,password,email);
    }

    @Override
    public User adminUserChange(Integer user_id, String name, String email, Integer type) {
        return userDao.adminUserChange(user_id,name,email,type);
    }


}
