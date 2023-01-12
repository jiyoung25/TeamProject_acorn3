package com.team.project.users.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.users.service.UsersService;
import com.team.project.users.dto.UsersDto;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	
	//아이디 중복 확인을 해서 json 문자열을 리턴해주는 메소드 
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		//UsersService 가 리턴해주는 Map 을 리턴해서 json 문자열을 응답한다.
		return service.isExistId(inputId);
	}
	
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
	
	@GetMapping("/users/loginform")
	public ModelAndView loginform(ModelAndView mView) {
		mView.addObject("test", "test");
		mView.setViewName("users/loginform");
		
		return mView;
	}

	
	@PostMapping("/users/login")
	public ModelAndView login(HttpServletRequest request, HttpSession session, String id, ModelAndView mView,
			String url, HttpServletResponse response, String inputPwd) {
		service.login(id, inputPwd, session, request, mView, response);
		
		//로그인 후에 가야할 목적지 정보를 인코딩 하지 않는것과 인코딩 한 것을 모두 ModelAndView 객체에 담는다. 
		/*
		String encodedUrl=URLEncoder.encode(url);
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		*/
		
		mView.setViewName("users/login");
		
		return mView;
	}
	
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		
		service.logout(session);
		
		return "redirect:/";
	}
	
	@RequestMapping("/users/profile1")
	public String profile1() {
		
		return "users/profile1";
	}
}
