package com.reins.bookstore.daoimpl;
import com.alibaba.fastjson.JSONArray;
import com.reins.bookstore.dao.UserDao;
import com.reins.bookstore.entity.User;
import com.reins.bookstore.entity.UserAuth;
import com.reins.bookstore.repository.UserAuthRepository;
import com.reins.bookstore.repository.UserRepository;
import com.reins.bookstore.utils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.concurrent.atomic.AtomicInteger;
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
    @Autowired
    RedisUtil redisUtil;

    @Override
    public List<User> getUsers() {
        List<User> allUsers=new ArrayList<User>();
        Object ul=redisUtil.get("allUsers");
        if(ul==null){
            allUsers=userRepository.getUsers();
            redisUtil.set("allUsers", JSONArray.toJSON(allUsers));
        }else{
            allUsers = JSONArray.parseArray(ul.toString(),User.class);
        }
       return allUsers;
    }

    @Override
    public UserAuth checkUser(String username, String password){
        Object ua=redisUtil.get("Auth"+username+"pass"+password);
        UserAuth userAuth=new UserAuth();
        if(ua==null){
            userAuth = userAuthRepository.checkUser(username,password);
            redisUtil.set("Auth"+username+"pass"+password, JSONArray.toJSON(userAuth));
        }else{
            userAuth =  JSONArray.parseObject(ua.toString(),UserAuth.class);
        }
        return userAuth;
    }

    @Override
    public ArrayList getAdminUser() {
        List<User> result = getUsers();
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
    public void refreshUserCache(){
        //refresh cache
        List<User> allUsers=userRepository.getUsers();
        redisUtil.set("allUsers", JSONArray.toJSON(allUsers));
    }


    @Override
    public User adminUserChange(Integer user_id, String name, String email, Integer type) {
        User user = userRepository.getUserByName(name);
        if(user==null){
            User u=new User(name,type,email);
            userRepository.save(u);
            refreshUserCache();
            return u;
        }
        else {
            user.setType(type);
            userRepository.save(user);
            //refresh cache
           refreshUserCache();
            return user;
        }
    }

    public UserAuth adminUserAuthChange( Integer userId, Integer type){
        UserAuth ua= userAuthRepository.getUserAuthByUserId(userId);
        ua.setUserType(type);
        userAuthRepository.save(ua);
        redisUtil.set("Auth"+ua.getUsername()+"pass"+ua.getPassword(), JSONArray.toJSON(ua));
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
        refreshUserCache();
        redisUtil.set("Auth"+newUserAuth.getUsername()+"pass"+newUserAuth.getPassword(), JSONArray.toJSON(newUserAuth));
        return newUser;
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED)
    public User getUserById(Integer userId){
        User user=new User();
        Object u=redisUtil.get("user"+userId);
        if(u==null){
            user = userRepository.getById(userId);
            redisUtil.set("user"+userId, JSONArray.toJSON(user));
        }else{
            user = JSONArray.parseObject(u.toString(),User.class);
        }
        return user;
    }

    private AtomicInteger num = new AtomicInteger(0);
    @Override
    public Integer addHomePV() {
        return num.incrementAndGet();
    }

}
