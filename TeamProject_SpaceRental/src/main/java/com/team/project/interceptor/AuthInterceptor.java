package com.team.project.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.team.project.interceptor.Auth.Role;

@Component
public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//Controller 는 HandlerMethod type이다.
		//Controller에 있는 method를 이용하여 auth를 체크하고 넘어갈 것이기 때문에 Controller가 아니면 흐름을 이어간다.
		if(handler instanceof HandlerMethod == false) {
			return true;
		}
		
		//Object type으로 매개변수로 받아온 handler를 Controller의 type인 HandlerMethod로 형변환한다.
		//(HandlerMethod가 아닌 handler들은 이미 위의 과정에서 return true;로 걸러졌다.)
		HandlerMethod handlerMethod = (HandlerMethod)handler;
	
		//만든 Auth annotation 받아오기
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

		//Auth annotation이 붙어있지 않으면 흐름을 이어간다.
		if(auth == null) {
			return true;
		}
		
		//Auth가 있는 경우에는 usersCode라는 key로 저장된 session value가 있는지 체크해본다.
		HttpSession session = request.getSession();
		if ( session.getAttribute("usersCode") == null ) {
			new LoginInterceptor();//로그인 인터셉터로 로그인을 시켜준다.
			return false;
		}

		//usersCode값이 있으면 usersCode라는 변수에 코드값을 저장한다.
		int usersCode = (int)session.getAttribute("usersCode");
		
		//권한이 관리자라면
		if(auth.role().compareTo(Role.ADMIN) == 0) {
			//usersCode = 1이 아니면 알림창을 띄우고 흐름을 끊고 home으로 이동시켜준다.
			if(usersCode != 1) {
				String redirectUrl = request.getContextPath() + "/";
				
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "alert('관리자 권한입니다.');"
						+ "location.href = " + redirectUrl
						+ "</script>");
				out.flush();
				out.close();
				return false;
			}
		}
		
		//권한이 판매자라면
		if(auth.role().compareTo(Role.SELLER) == 0) {
			//usersCode = 2이 아니면 알림창을 띄우고 흐름을 끊고 home으로 이동시켜준다.
			if(usersCode != 2) {
				String redirectUrl = request.getContextPath() + "/";
				
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "alert('판매자 권한입니다.');"
						+ "location.href = " + redirectUrl
						+ "</script>");
				out.flush();
				out.close();
				return false;
			}
		}
		
		//권한이 구매자라면
		if(auth.role().compareTo(Role.USER) == 0) {
			//usersCode = 3이 아니면 알림창을 띄우고 흐름을 끊고 home으로 이동시켜준다.
			if(usersCode != 3) {
				String redirectUrl = request.getContextPath() + "/";
				
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "alert('구매자 권한입니다.');"
						+ "location.href = " + redirectUrl
						+ "</script>");
				out.flush();
				out.close();
				return false;
			}
		}
		return true;
	}
}
