package org.reins.springorm.sample.service;

import org.reins.springorm.sample.entity.Event;

public interface EventService {
    Event findEventById(Integer id);
}
