package org.reins.springorm.sample.service;

import org.reins.springorm.sample.entity.Person;

public interface PersonService {
    Person findPersonById(Integer id);
}
