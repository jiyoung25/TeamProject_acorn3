package com.team.project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.team.project.interceptor.LoginInterceptor;
import com.team.project.interceptor.UsersCodeInterceptor;


@Configuration
public class WebConfig implements WebMvcConfigurer{
	//로그인 인터셉터 주입 받기
	@Autowired LoginInterceptor loginInterceptor;
	@Autowired UsersCodeInterceptor uci;
	
	//인터셉터 동작하도록 등록하기
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		/*
		registry.addInterceptor(loginInterceptor)
		.addPathPatterns("/users/*","/space/*", "/seller/*","/review/*","/qna/*")
		.excludePathPatterns("/users/signupform", "/users/signup", "/users/loginform", "/users/login", "/users/checkid",
				"/space/category", "/space/list", "/space/detail",
				"/review/reviewdetail","/review/reviewlist",
				"/qna/qnadetail","/qna/qnalist","/qna/ajax_comment_list");
				*/
		
		registry.addInterceptor(uci)
		.addPathPatterns("/**");
	}
}











