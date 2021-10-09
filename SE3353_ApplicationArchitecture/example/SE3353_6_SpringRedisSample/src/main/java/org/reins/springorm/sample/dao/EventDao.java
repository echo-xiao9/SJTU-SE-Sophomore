package org.reins.springorm.sample.dao;

import org.reins.springorm.sample.entity.Event;
/**
 * Created by chenhaopeng on 2019/5/2.
 */
public interface EventDao {
    Event findOne(Integer id);
}
