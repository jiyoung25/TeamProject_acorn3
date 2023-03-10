package com.team.project.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.users.service.JwtService;
import com.team.project.users.service.UsersService;

//로그인된 사용자인지 검사할 인터셉터
@Component
public class LoginInterceptor implements HandlerInterceptor{

    @Autowired
    private UsersService userService;

    @Autowired
    private JwtService jwtUtil;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // JWT를 사용하여 로그인 여부를 확인합니다.
        String token = request.getHeader("Authorization");
        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7);
            if (jwtUtil.isUsable(token)) {
                String id = jwtUtil.getSubject(token);
                if (userService.isExistId(id) != null) {
                    return true;
                }
            }
        }

        // 로그인하지 않았을 경우, 로그인 페이지로 리다이렉트합니다.
        String url = request.getRequestURI();
        String query = request.getQueryString();
        String encodedUrl = URLEncoder.encode(url + "?" + query);

        String cPath = request.getContextPath();
        response.sendRedirect(cPath + "/users/loginform?url=" + encodedUrl);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
            Exception ex) throws Exception {
    }
}
