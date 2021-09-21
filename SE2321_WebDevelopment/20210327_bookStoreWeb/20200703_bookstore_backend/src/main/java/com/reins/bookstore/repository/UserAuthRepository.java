package com.reins.bookstore.repository;

import com.reins.bookstore.entity.User;
import com.reins.bookstore.entity.UserAuth;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;


public interface UserAuthRepository extends JpaRepository<UserAuth,String>{

    @Query(value = "from UserAuth where username = :username and password = :password")
    UserAuth checkUser(@Param("username") String username, @Param("password") String password);

    @Query("select p from UserAuth p where  p.username=:username")
    UserAuth getUserAuthByUserName(@Param("username") String username);

    @Query("select p from UserAuth p where  p.userId=:userId")
    UserAuth getUserAuthByUserId(@Param("userId") Integer userId);

    @Transactional
    void deleteByUsername(String username);

}
