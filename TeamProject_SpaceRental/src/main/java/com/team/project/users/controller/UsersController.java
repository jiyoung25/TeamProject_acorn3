package com.team.project.users.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.users.service.UsersService;
import com.team.project.dib.service.DibService;
import com.team.project.users.dto.UsersDto;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	@Autowired
	private DibService dibService;
	
	//아이디 중복 확인을 해서 json 문자열을 리턴해주는 메소드 
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		//UsersService 가 리턴해주는 Map 을 리턴해서 json 문자열을 응답한다.
		return service.isExistId(inputId);
	}
	
	@RequestMapping("/users/signupform")
	public String signupform() {
		
		return "users/signupform";
	}
	
	// 회원 가입 요청처리
	@RequestMapping(method = RequestMethod.POST, value = "/users/signup")
	public ModelAndView signup(ModelAndView mView, UsersDto dto) {
		service.addUser(dto);
		mView.addObject("code", dto.getCode());
		mView.setViewName("users/signup");
		return mView;
	}
	
	@GetMapping("/users/loginform")
	public ModelAndView loginform(ModelAndView mView) {
		mView.setViewName("users/loginform");
		
		return mView;
	}

	
	@PostMapping("/users/login")
	public ModelAndView login(HttpServletRequest request, HttpSession session, String id, ModelAndView mView,
			String url, HttpServletResponse response, String inputPwd) {
		
		service.login(id, inputPwd, session, request, mView, response);
		
		System.out.println("url:"+url);
		//로그인 후에 가야할 목적지 정보를 인코딩 하지 않는것과 인코딩 한 것을 모두 ModelAndView 객체에 담는다.
		String encodedUrl=URLEncoder.encode(url);
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		
		mView.setViewName("users/login");
		return mView;
	}
	
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		
		service.logout(session);
		
		return "redirect:/";
	}
	
	@RequestMapping("/users/profile1")
	public ModelAndView profile1(HttpSession session, ModelAndView mView) {
		service.getInfo(session, mView);
		mView.setViewName("users/profile1");
		return mView;
	}
	@RequestMapping("/users/dib_list")
	public String dib_list(HttpServletRequest request,HttpSession session) {
		dibService.dibGetData(request, session);
		return "users/dib_list";
	}
	//비밀번호 수정폼 요청 처리
	@RequestMapping("/users/pwd_updateform")
	public String pwdUpdateForm() {
		return "users/pwd_updateform";
	}
	//비밀번호 수정 요청 처리
	@RequestMapping("/users/pwd_update")
	public ModelAndView pwdUpdate(UsersDto dto, ModelAndView mView, HttpSession session) {
		//서비스에 필요한 객체의 참조값을 전달해서 비밀번호 수정 로직을 처리한다.
		service.updateUserPwd(session, dto, mView);
		//view page 로 forward 이동해서 작업 결과를 응답한다.
		mView.setViewName("users/pwd_update");
		return mView;
	}
	
	//카카오 API에서 전송된 code 받기
	@RequestMapping(value="/users/kakaoLoginCode", method=RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest request, ModelAndView mView) throws Throwable {
		System.out.println("#########" + code);
		String access_Token = service.getAccessToken(code);
        
		// 위에서 만든 코드 아래에 코드 추가
		service.getUserInfo(access_Token, request, mView);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###email#### : " + mView.getModelMap().getAttribute("email"));
		System.out.println("###kakaoId###: " + mView.getModelMap().getAttribute("kakaoId"));
		System.out.println("###kakaoExist###: " + mView.getModelMap().getAttribute("kakaoExist"));
        
		mView.setViewName("users/kakaoLoginCode");
		
		return mView;
    	}
}
