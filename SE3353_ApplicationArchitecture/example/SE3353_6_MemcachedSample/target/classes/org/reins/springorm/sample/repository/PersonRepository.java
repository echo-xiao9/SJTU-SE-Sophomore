package org.reins.springorm.sample.repository;

import org.reins.springorm.sample.entity.Person;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonRepository extends JpaRepository<Person, Integer>{

}

