package com.team.project.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

//로그인된 사용자인지 검사할 인터셉터
@Component
public class LoginInterceptor implements HandlerInterceptor{
	
	//Controller 메소드 수행직전에 로그인된 사용자 인지 검증을 해서 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//세션 객체의 참조값을 얻어와서 
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		//만일 로그인을 하지 않았다면
		if(id == null) {
			//로그인 페이지로 리다일렉트 이동 시키고 false 를 리턴한다.
			//context path
			String cPath=request.getContextPath();
			//원래 가려던 url 정보 읽어오기
			String url=request.getRequestURI();
			//GET 방식 전송 파라미터를 query 문자열로 읽어오기 ( a=xxx&b=xxx&c=xxx )
			String query=request.getQueryString();
			//특수 문자는 인코딩을 해야한다.
			String encodedUrl=null;
			if(query==null) {//전송 파라미터가 없다면 
				encodedUrl=URLEncoder.encode(url);
				}else {
				// 원래 목적지가 /test/xxx.jsp 라고 가정하면 아래와 같은 형식의 문자열을 만든다.
				// "/test/xxx.jsp?a=xxx&b=xxx ..."
				encodedUrl=URLEncoder.encode(url+"?"+query);
			}
			
			//3. 로그인을 하지 않았다면  /users/loginform 페이지로 리다일렉트 이동 시킨다. (HttpServletResponse)
			response.sendRedirect(cPath+"/users/loginform?url="+encodedUrl);
			//context path를 뺀 url경로
			request.setAttribute("servletPath", request.getServletPath());
			
			return false;
		}
		
		//로그인을 했다면 흐름을 이어간다.
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
