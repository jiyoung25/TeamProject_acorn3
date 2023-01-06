package com.team.project.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.users.service.UsersService;
import com.team.project.users.dto.UsersDto;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	
	@RequestMapping(method = RequestMethod.GET, value = "/users/signupselect")
	public String signupForm() {
		
		return "users/signupselect";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/users/signupform_manager")
	public String signupFormManager() {
		
		return "users/signupform_manager";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/users/signupform_seller")
	public String signupFormSeller() {
		
		return "users/signupform_seller";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/users/signupform_users")
	public String signupFormUsers() {
		
		return "users/signupform_users";
	}
	
	//회원 가입 요청처리
		@RequestMapping(method = RequestMethod.POST, value = "/users/signup")
		public ModelAndView signup(ModelAndView mView, UsersDto dto ) {
			service.addUser(dto);
			mView.setViewName("users/signup");
			return mView;
		}
}
