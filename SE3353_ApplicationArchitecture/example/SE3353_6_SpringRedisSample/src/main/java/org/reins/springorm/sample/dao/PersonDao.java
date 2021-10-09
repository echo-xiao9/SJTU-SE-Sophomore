package org.reins.springorm.sample.dao;

import org.reins.springorm.sample.entity.Person;

/**
 * Created by chenhaopeng on 2019/5/2.
 */
public interface PersonDao {
    Person findOne(Integer id);
}
