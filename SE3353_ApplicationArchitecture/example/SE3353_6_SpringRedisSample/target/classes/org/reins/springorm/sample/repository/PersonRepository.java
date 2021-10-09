package org.reins.springorm.sample.repository;

import org.reins.springorm.sample.entity.Person;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by chenhaopeng on 2019/5/2.
 */
public interface PersonRepository extends JpaRepository<Person, Integer>{

}

