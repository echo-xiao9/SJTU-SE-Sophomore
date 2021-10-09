package org.reins.springorm.sample.repository;

import org.reins.springorm.sample.entity.Event;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository<Event, Integer>{

}

