package org.reins.demo;

import org.reins.demo.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;

@RestController
public class MsgController {
    @Autowired
    WebApplicationContext applicationContext;

    @GetMapping(value = "/msg")
    public void findOne( ) {
        JmsTemplate jmsTemplate = applicationContext.getBean(JmsTemplate.class);
        // Send a message with a POJO - the template reuse the message converter
        System.out.println("Sending an email message.");
        jmsTemplate.convertAndSend("mailbox", new Email("info@example.com", "Hello Msg"));
    };
}