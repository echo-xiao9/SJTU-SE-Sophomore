package com.example.rootweblearning1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class RootWebLearning1Application {

    public static void main(String[] args) {
        SpringApplication.run(RootWebLearning1Application.class, args);
    }

}
