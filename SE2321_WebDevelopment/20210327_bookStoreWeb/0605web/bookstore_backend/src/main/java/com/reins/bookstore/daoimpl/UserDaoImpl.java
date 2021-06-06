package com.reins.bookstore.daoimpl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.reins.bookstore.constant.Constant;
import com.reins.bookstore.dao.UserDao;
import com.reins.bookstore.entity.User;
import com.reins.bookstore.entity.UserAuth;
import com.reins.bookstore.repository.UserAuthRepository;
import com.reins.bookstore.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @ClassName UserDaoImpl
 * @Description the implement of user dao
 * @Author thunderBoy
 * @Date 2019/11/7 13:19
 */
@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    UserAuthRepository userAuthRepository;

    @Autowired
    UserRepository userRepository;

    @Override
    public List<User> getUsers() {
        return userRepository.getUsers();
    }

    @Override
    public UserAuth checkUser(String username, String password){

        return userAuthRepository.checkUser(username,password);
    }

    @Override
    public ArrayList getAdminUser() {
        List<User> result = userRepository.getUsers();
        Iterator<User> it = result.iterator();
        ArrayList<com.alibaba.fastjson.JSONArray> usersJson = new ArrayList<JSONArray>();
        while (it.hasNext()){
            User user = (User) it.next();
            ArrayList<String >arrayList = new ArrayList<String>();
            arrayList.add(user.getUserId().toString());
            arrayList.add(user.getName());
            arrayList.add(user.getNickname());
            arrayList.add(user.getTel());
            arrayList.add(user.getType().toString());
            usersJson.add((JSONArray) JSONArray.toJSON(arrayList));
        }
        return usersJson;
    }



}
