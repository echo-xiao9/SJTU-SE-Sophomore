package org.reins.spring.security.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(maxAge = 3600)
@RestController
public class GreetingController {
	@GetMapping("/about")
	public String getAbout() {
		return "This is a Spring security sample";
	}

	@GetMapping("/users")
	public String getUser() {
		return "I am a user";
	}

	@GetMapping("/")
	public String getHome() {
		return "Let' start!";
	}

}
