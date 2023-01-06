package com.team.project.users.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCrypt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.users.dao.UsersDao;
import com.team.project.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao dao;

	@Override
	public void login(String id, HttpSession session, HttpServletRequest request, ModelAndView mView, HttpServletResponse response) {
		String inputPwd = (String)request.getAttribute("pwd");
		UsersDto dto = dao.getData(id);
		boolean isPwdOk = false;
		
		// id정보가 있으면 pwd체크하기
		if(dto != null) {
			String pwd = dto.getPwd();
			isPwdOk = BCrypt.checkpw(inputPwd, pwd);
		}
		
		// id와 pwd가 일치하면
		if(isPwdOk) {
			//세션에 id값 저장, dto값은 mView로 보냄
			session.setAttribute("id", id);
			mView.addObject("dto", dto);
			
			//remember box의 체크 여부 가져오기
			String remember = (String)request.getAttribute("remember");
			if(remember == null) {
				remember = "false"; //remember가 null이면 아래에서 오류남
			}
			if(remember.equals("true")) {
				Cookie cookId = new Cookie("savedId", id);
				cookId.setMaxAge(60*60*24*7); //7일동안 cookie 저장
				response.addCookie(cookId);
			} else {
				Cookie cookId = new Cookie("savedId", "no");
				cookId.setMaxAge(0);//쿠키 삭제
				response.addCookie(cookId);
			}
		}
	}

	@Override
	public void logout(HttpSession session) {
		session.removeAttribute("id");
	}

}
