package com.reins.bookstore.controller;

import com.reins.bookstore.entity.User;
import com.reins.bookstore.entity.UserAuth;
import com.reins.bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName UserController
 * @Description the controller of user
 * @Author thunderBoy
 * @Date 2019/11/7 13:47
 */

@RestController
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/getUser")
    public List<User> getUsers(){return userService.getUsers();}

    @GetMapping("/getUserByName")
    public User getUserByName(@RequestParam("username") String username){
        return userService.getUserByName(username);
    }

    @GetMapping("/addUser")
    public User addUser(@RequestParam("username")String username,
                        @RequestParam("password")String password,
                        @RequestParam("email")String email
                        ){return userService.addUser(username,password,email);}


    @RequestMapping("/checkUser")
    public UserAuth checkUser(@RequestParam("username") String username,@RequestParam("password") String password){
        return userService.checkUser(username, password);
    }

    @GetMapping("/adminUser")
    public ArrayList getAdminUser(){
        return userService.getAdminUser();
    }

    @GetMapping("/adminUserChange")
   public User adminUserChange(@RequestParam("user_id")  Integer user_id,
                               @RequestParam("name") String name,
                               @RequestParam("email") String email,
                               @RequestParam Integer type){
        UserAuth ua=userService.adminUserAuthChange(user_id, type);
        User u=userService.adminUserChange(user_id, name,email, type);
        return u;
    }

}
