package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @ClassName UserController
 * @Description the controller of user
 * @Author kangyixiao
 * @Date 2020/5/7
 */
@RestController
public class UserController {
    @Autowired
    private CustomUserDetailsService customUserDetailsService;
    @Autowired
    private UserRepository userRepository;
    @GetMapping("/testUser")
    public String test () {
        return "This is a test user!";
    }
    @GetMapping("/checkGotoHome") /*检查是否能进入首页*/
    public ResponseEntity<User> checkGotoHome(
            @RequestParam (required = false) String username,
            @RequestParam (required = false) String password) {
        User user = userRepository.findByUsernameAndPassword(username, password);
        System.out.println("---------------------");
        if (user != null) return new ResponseEntity<>(user, HttpStatus.OK);
        else return new ResponseEntity<>(null, HttpStatus.NOT_FOUND); /* 注意返回Http状态 */
//        return new ResponseEntity<>(user, HttpStatus.OK);
    }

//    @GetMapping(path="/getUsers")
//    public ResponseEntity<List<User>> getUser
//            (@RequestParam (required = false) String username,
//             @RequestParam (required = false) String password) {
//        User user = userRepository.findByUsernameAndPassword(username, password);
//        if (user != null && "ADMIN".equals(user.getUserRole()))
//            return new ResponseEntity<>(customUserDetailsService.getUsers(), HttpStatus.OK);
//        else return new ResponseEntity<>(null, HttpStatus.NOT_ACCEPTABLE);
//    }

        @GetMapping(path="/getUsers")
        public ResponseEntity<List<User>> getUsers
        (@RequestParam (required = false) String username,
         @RequestParam (required = false) String password) {
            return new ResponseEntity<>(customUserDetailsService.getUsers(), HttpStatus.OK); /* 注意返回Http状态 */
        }

//    @GetMapping(path="/getUsers")
//    public ResponseEntity<Integer> getUsers
//            (@RequestParam (required = false) String username,
//             @RequestParam (required = false) String password) {
//        System.out.println("---------------------");
//        return new ResponseEntity<>(0, HttpStatus.OK); /* 注意返回Http状态 */
//    }
}