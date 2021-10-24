package org.reins.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;

@RestController
public class MsgController {
    @Autowired
    WebApplicationContext applicationContext;

    @GetMapping(value = "/msg")
    public String findOne( ) {
        System.out.println("Sending an email message.");
        return "Hello World!";
    };
}