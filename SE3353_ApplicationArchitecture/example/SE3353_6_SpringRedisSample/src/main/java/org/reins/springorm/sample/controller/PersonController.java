package org.reins.springorm.sample.controller;

import org.reins.springorm.sample.entity.Person;
import org.reins.springorm.sample.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PersonController {

    @Autowired
    private PersonService personService;

    @GetMapping(value = "/findPerson/{id}")
    public Person findPerson(@PathVariable("id") Integer id) {
        System.out.println("Searching Person: " + id);
        return personService.findPersonById(id);
    }

}
