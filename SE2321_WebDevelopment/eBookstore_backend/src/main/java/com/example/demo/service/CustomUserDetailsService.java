package com.example.demo.service;
import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        System.out.println(user);
        if (user == null) {
            throw new UsernameNotFoundException("User Not Found");
        }
        else {
            /*设置token形式密码*/
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            user.setUserPassword(passwordEncoder.encode(user.getUserPassword()));
            System.out.println(user.getUserPassword());
        }
        return new CustomUserDetails(user);
    }
    /*获取用户信息*/
    public List<User> getUsers () {
        List<User> userList = new ArrayList<>();
        List<String> usernameList = new ArrayList<>();
        List<String> passwordList = new ArrayList<>();

        usernameList.addAll(jdbcTemplate.queryForList("select username from user;", String.class));
        passwordList.addAll(jdbcTemplate.queryForList("select password from user;", String.class));
        for (int i = 0; i < usernameList.size(); i++)
            userList.add(new User(usernameList.get(i), passwordList.get(i)));
        return userList;
    }
}
