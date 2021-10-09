package org.reins.springorm.sample.serviceimpl;

import org.reins.springorm.sample.dao.EventDao;
import org.reins.springorm.sample.service.EventService;
import org.reins.springorm.sample.entity.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by chenhaopeng on 2019/5/2.
 */
@Service
public class EventServiceImpl implements EventService {

    @Autowired
    private EventDao eventDao;

    @Override
    public Event findEventById(Integer id){
        return eventDao.findOne(id);
    }
}
