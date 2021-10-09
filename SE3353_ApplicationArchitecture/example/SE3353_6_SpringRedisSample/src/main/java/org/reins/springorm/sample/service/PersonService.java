package org.reins.springorm.sample.service;

import org.reins.springorm.sample.entity.Person;

/**
 * Created by chenhaopeng on 2019/5/2.
 */
public interface PersonService {
    Person findPersonById(Integer id);
}
