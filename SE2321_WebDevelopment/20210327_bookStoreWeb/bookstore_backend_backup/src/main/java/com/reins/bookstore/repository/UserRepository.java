package com.reins.bookstore.repository;

import com.reins.bookstore.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface UserRepository extends JpaRepository<User,Integer> {

    @Query("select u from User u")
    List<User> getUsers();

    @Query("select p from User p where  p.name=:name")
    User getUserByName(String name);

    @Transactional
    void deleteByName(String name);
}
