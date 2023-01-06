package com.team.project.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.team.project.interceptor.LoginInterceptor;


@Configuration
public class WebConfig implements WebMvcConfigurer{
	//로그인 인터셉터 주입 받기
	@Autowired LoginInterceptor loginInterceptor;
	
	//인터셉터 동작하도록 등록하기
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	}
}











