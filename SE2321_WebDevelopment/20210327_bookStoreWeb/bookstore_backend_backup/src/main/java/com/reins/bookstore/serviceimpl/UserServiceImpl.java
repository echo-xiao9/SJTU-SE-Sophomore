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
    public User adminUserChange(Integer user_id, String name, String nickname, String tel, String address, Integer type) {
        return userDao.adminUserChange(user_id, name,nickname,tel,address, type);
    }

    @Override
    public UserAuth adminUserAuthChange(String name, Integer type) {
        return userDao.adminUserAuthChange(name,type);
    }


}
