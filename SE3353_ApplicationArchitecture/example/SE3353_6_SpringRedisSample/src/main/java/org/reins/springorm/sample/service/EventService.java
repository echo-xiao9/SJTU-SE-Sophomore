package org.reins.springorm.sample.service;

import org.reins.springorm.sample.entity.Event;
/**
 * Created by chenhaopeng on 2019/5/2.
 */
public interface EventService {
    Event findEventById(Integer id);
}
