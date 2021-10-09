package org.reins.springorm.sample.daoimpl;

import org.reins.springorm.sample.dao.EventDao;
import org.reins.springorm.sample.entity.Event;
import org.reins.springorm.sample.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class EventDaoImpl implements EventDao {
        @Autowired
        private EventRepository eventRepository;


        @Override
        public Event findOne(Integer id) {
            return eventRepository.getOne(id);
        }
}
