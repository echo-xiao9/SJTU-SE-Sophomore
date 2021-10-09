package org.reins.springorm.sample.dao;

import org.reins.springorm.sample.entity.Person;

public interface PersonDao {
    Person findOne(Integer id);
}
