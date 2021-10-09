package org.reins.springorm.sample.daoimpl;

import com.google.code.ssm.api.ParameterValueKeyProvider;
import com.google.code.ssm.api.ReadThroughSingleCache;
import org.reins.springorm.sample.dao.PersonDao;
import org.reins.springorm.sample.entity.Event;
import org.reins.springorm.sample.entity.Person;
import org.reins.springorm.sample.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Optional;

import static org.springframework.data.domain.jaxb.SpringDataJaxb.NAMESPACE;

@Repository
public class PersonDaoImpl implements PersonDao {
    @Autowired
    private PersonRepository personRepository;

    @Override
    @ReadThroughSingleCache(namespace = "Alpha", expiration = 3600)
    public Person findOne(@ParameterValueKeyProvider Integer id) {
        return personRepository.getOne(id);
    }
}
