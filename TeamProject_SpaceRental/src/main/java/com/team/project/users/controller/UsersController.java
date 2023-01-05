package com.team.project.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsersController {
	
	@RequestMapping("/users/signupform")
	public String signupform() {
		return "users/signupform";
	}
	
	@RequestMapping("/users/loginform")
	public String loginform() {
		return "users/loginform";
	}
}
