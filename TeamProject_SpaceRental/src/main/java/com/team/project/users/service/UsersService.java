package com.team.project.users.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface UsersService {
	public void login(String id, HttpSession session, HttpServletRequest request, ModelAndView mView, HttpServletResponse response);
	public void logout(HttpSession session);
}
