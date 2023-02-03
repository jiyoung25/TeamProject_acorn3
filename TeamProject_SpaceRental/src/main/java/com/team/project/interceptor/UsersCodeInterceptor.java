package com.team.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.team.project.users.dto.UsersDto;

@Component
public class UsersCodeInterceptor implements HandlerInterceptor {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int usersCode = 0;
		if(id != null) {
			UsersDto dto = sqlSession.selectOne("users.getData", id);
			usersCode = dto.getCode();
		}
		
		request.setAttribute("usersCode", usersCode);
		return true;
	}
}
