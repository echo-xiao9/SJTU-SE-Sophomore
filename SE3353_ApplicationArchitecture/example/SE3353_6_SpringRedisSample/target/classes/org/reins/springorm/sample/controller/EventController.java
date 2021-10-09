package org.reins.springorm.sample.controller;

import org.reins.springorm.sample.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.reins.springorm.sample.entity.Event;

@RestController
public class EventController {

    @Autowired
    private EventService eventService;

    @GetMapping(value = "/findEvent/{id}")
    public Event findEvent(@PathVariable("id") Integer id) {
        System.out.println("Searching Event: " + id);
        return eventService.findEventById(id);
    }
}
