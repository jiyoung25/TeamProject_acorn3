package com.team.project.users.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.users.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	
	@RequestMapping("/users/signupform")
	public String signupform() {
		return "users/signupform";
	}
	
	@RequestMapping("/users/loginform")
	public String loginform() {
		return "users/loginform";
	}
	
	@PostMapping("/users/login")
	public ModelAndView login(HttpServletRequest request, HttpSession session, String id, ModelAndView mView,
			String url, HttpServletResponse response) {
		service.login(id, session, request, mView, response);
		
		//로그인 후에 가야할 목적지 정보를 인코딩 하지 않는것과 인코딩 한 것을 모두 ModelAndView 객체에 담는다. 
		String encodedUrl=URLEncoder.encode(url);
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		
		mView.setViewName("users/login");
		
		return mView;
	}
}
