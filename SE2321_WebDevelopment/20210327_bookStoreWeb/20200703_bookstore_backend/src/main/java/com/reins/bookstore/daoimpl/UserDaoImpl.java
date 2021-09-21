package com.reins.bookstore.daoimpl;
import com.alibaba.fastjson.JSONArray;
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
public class UserDaoImpl<data1> implements UserDao {

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
            arrayList.add(user.getEmail());
            arrayList.add(user.getType().toString());
            usersJson.add((JSONArray) JSONArray.toJSON(arrayList));
        }
        return usersJson;
    }


    @Override
    public User adminUserChange(Integer user_id, String name, String email, Integer type) {
        User user = userRepository.getUserByName(name);
        if(user==null){
            User u=new User(name,type,email);
            userRepository.save(u);
            return u;
        }
        else {
            user.setType(type);
            userRepository.save(user);
            return user;
        }
    }

    public UserAuth adminUserAuthChange( Integer userId, Integer type){
        UserAuth ua= userAuthRepository.getUserAuthByUserId(userId);
//        User user=userRepository.getUserByName(name);

       ua.setUserType(type);
        userAuthRepository.save(ua);
//        user.setType(type);
//        userRepository.save(user);
        return ua;
    }

    public User getUserByName(String name)
    {
        return userRepository.getUserByName(name);
    }

    @Override
    public User addUser(String username, String password, String email) {
        User newUser= new User(username,2,email);
        userRepository.save(newUser);
        User userGot=userRepository.getUserByName(username);
        Integer id=userGot.getUserId();
        UserAuth newUserAuth=new UserAuth(id, username,password,2);
        userAuthRepository.save(newUserAuth);
        System.out.println(newUserAuth);
        return newUser;
    }

}
