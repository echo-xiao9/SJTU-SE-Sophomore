package org.reins.springorm.sample.daoimpl;


import com.alibaba.fastjson.JSONArray;
import org.reins.springorm.sample.dao.PersonDao;
import org.reins.springorm.sample.entity.Event;
import org.reins.springorm.sample.entity.Person;
import org.reins.springorm.sample.repository.PersonRepository;
import org.reins.springorm.sample.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
 * Created by chenhaopeng on 2019/5/2.
 */
@Repository
public class PersonDaoImpl implements PersonDao {
    @Autowired
    private PersonRepository personRepository;

    @Autowired
    RedisUtil redisUtil;

    @Override
    public Person findOne(Integer id) {
        Person person = null;
        System.out.println("Searching Person: " + id + " in Redis");
        Object p = redisUtil.get("user" + id);
        if (p == null) {
            System.out.println("Person: " + id + " is not in Redis");
            System.out.println("Searching Person: " + id + " in DB");
            person = personRepository.getOne(id);
            redisUtil.set("user" + id, JSONArray.toJSON(person));
        } else {
            person = JSONArray.parseObject(p.toString(), Person.class);
            System.out.println("Person: " + id + " is in Redis");

        }
        return person;
    }
}
