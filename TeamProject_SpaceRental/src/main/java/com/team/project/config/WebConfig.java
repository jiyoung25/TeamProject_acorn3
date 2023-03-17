package com.team.project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.team.project.interceptor.AuthInterceptor;
import com.team.project.interceptor.LoginInterceptor;
//import com.team.project.interceptor.UsersCodeInterceptor;


@Configuration
public class WebConfig implements WebMvcConfigurer{
	//인터셉터 주입 받기
	@Autowired LoginInterceptor loginInterceptor;
	@Autowired AuthInterceptor authInterceptor;
	
	//인터셉터 동작하도록 등록하기
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor)
		.addPathPatterns("/users/*","/space/*", "/seller/*","/review/*","/qna/*")
		.excludePathPatterns("/users/signupform", "/users/signup", "/users/loginform", "/users/login", "/users/checkid", "/users/kakaoLoginCode",
				"/space/category", "/space/list", "/space/detail", "/space/marker", "/space/navigator", "/space/uploadImage", "/space/ckImage",
				"/review/reviewdetail","/review/reviewlist",
				"/qna/qnadetail","/qna/qnalist","/qna/ajax_comment_list");
		
		registry.addInterceptor(authInterceptor);
	}
}











