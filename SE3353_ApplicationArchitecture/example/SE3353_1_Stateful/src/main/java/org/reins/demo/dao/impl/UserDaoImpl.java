package org.reins.demo.dao.impl;

import org.reins.demo.dao.UserDao;
import org.reins.demo.entity.User;
import org.reins.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User findOne(Integer id) {
        return userRepository.getOne(id);
    }
}
