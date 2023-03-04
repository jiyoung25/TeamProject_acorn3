package com.team.project.users.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.qna.dto.QnaDto;
import com.team.project.review.dto.ReviewDto;
import com.team.project.users.dto.UsersDto;

public interface UsersService {
	public Map<String, Object> isExistId(String inputId);
	public void addUser(UsersDto dto);
	public void login(String id, String inputPwd, HttpSession session, HttpServletRequest request, ModelAndView mView,
			HttpServletResponse response);
	public void logout(HttpSession session);
	public void getInfo(HttpSession session, ModelAndView mView);
	public void getReviewUsersnum(HttpSession session, ReviewDto dto);
	public void getQnaUsersnum(HttpSession session, QnaDto dto);
	public void updateUserPwd(HttpSession session, UsersDto dto, ModelAndView mView);
	public Map<String, Object> saveProfileImage(HttpServletRequest request, 
			MultipartFile mFile);
	public void updateUser(UsersDto dto, HttpSession session);
	public void deleteUser(HttpSession session, ModelAndView mView);
	public String getAccessToken(String authorize_code, HttpServletRequest request) throws Throwable;
	public ModelAndView getUserInfo(String access_Token, HttpServletRequest request, ModelAndView mView);
}