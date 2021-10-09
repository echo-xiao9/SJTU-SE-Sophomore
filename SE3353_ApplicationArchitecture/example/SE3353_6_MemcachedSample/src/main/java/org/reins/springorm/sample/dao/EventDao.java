package org.reins.springorm.sample.dao;

import org.reins.springorm.sample.entity.Event;

public interface EventDao {
    Event findOne(Integer id);
}
