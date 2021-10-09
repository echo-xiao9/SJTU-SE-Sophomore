package org.reins.springorm.sample.serviceimpl;

import org.reins.springorm.sample.dao.PersonDao;
import org.reins.springorm.sample.entity.Person;
import org.reins.springorm.sample.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    private PersonDao personDao;

    @Override
    public Person findPersonById(Integer id){
        return personDao.findOne(id);
    }
}
