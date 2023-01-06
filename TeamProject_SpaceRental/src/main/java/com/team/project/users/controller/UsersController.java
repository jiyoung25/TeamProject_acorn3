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

	@RequestMapping("/users/signupform")
	public String signupform() {
		
		return "users/signupform";
	}
	
	// 회원 가입 요청처리
	@RequestMapping(method = RequestMethod.POST, value = "/users/signup")
	public ModelAndView signup(ModelAndView mView, UsersDto dto) {
		service.addUser(dto);
		mView.addObject("code", dto.getCode());
		mView.setViewName("users/signup");
		return mView;
	}

}
