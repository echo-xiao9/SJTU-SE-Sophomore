package org.reins.demo.dao;

import org.reins.demo.entity.User;

public interface UserDao {
    User findOne(Integer id);
}
