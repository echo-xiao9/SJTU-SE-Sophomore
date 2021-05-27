package com.example.demo.repository;

//public class UserRepository {
//
//}

import com.example.demo.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface UserRepository extends
        JpaRepository<User, Long> {
    User findByUsernameAndPassword(String username, String
            password);
    User findByUsername(String username);
}
