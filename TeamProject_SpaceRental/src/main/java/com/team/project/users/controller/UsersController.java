package com.team.project.users.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.users.service.UsersService;
import com.team.project.dib.service.DibService;
import com.team.project.interceptor.Auth;
import com.team.project.interceptor.Auth.Role;
import com.team.project.users.dto.UsersDto;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	
	@Autowired
	private DibService dibService;
	
	@Value("${file.location}")
	private String fileLocation;
	
	@GetMapping(
			value="/users/images/{imageName}",
			produces = {MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE, MediaType.IMAGE_GIF_VALUE}
		)
	@ResponseBody
	public byte[] profileImage(@PathVariable("imageName") String imageName) throws IOException {
		
		String absolutePath=fileLocation+File.separator+imageName;
		//파일에서 읽어들일 InputStream
		InputStream is=new FileInputStream(absolutePath);
		// 이미지 데이터(byte) 를 읽어서 배열에 담아서 클라이언트에게 응답한다.
		return IOUtils.toByteArray(is);
	}
	
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
	
	@Auth(role = Role.USER)
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
	//회원 탈퇴 요청 처리
	@RequestMapping("/users/delete")
	public ModelAndView delete(HttpSession session, ModelAndView mView) {
		service.deleteUser(session, mView);
		mView.setViewName("users/delete");
		return mView;
	}
	
	@RequestMapping("/users/updateform")
	public ModelAndView updateform(HttpSession session, ModelAndView mView) {
		service.getInfo(session, mView);
		mView.setViewName("users/updateform");
		return mView;
	}
	
	//개인정보 수정 반영 요청 처리
	@RequestMapping(value = "/users/update", method=RequestMethod.POST)
	public ModelAndView update(UsersDto dto, HttpSession session, ModelAndView mView,
			HttpServletRequest request) {
		//서비스를 이용해서 개인정보를 수정하고
		service.updateUser(dto, session);
		mView.setViewName("redirect:/users/profile1");
		//개인정보 보기로 리다이렉트 이동 시킨다
		return mView;
	}
	
	//ajax 프로필 사진 업로드 요청처리
	@RequestMapping(value = "/users/profile_upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> profileUpload(HttpServletRequest request, MultipartFile image){
		//서비스를 이용해서 이미지를 upload 폴더에 저장하고 리턴되는 Map 을 리턴해서 json 문자열 응답하기
		return service.saveProfileImage(request, image);
	}
	
	//카카오 API에서 전송된 code 받기
	@RequestMapping(value="/users/kakaoLoginCode", method=RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest request, ModelAndView mView) throws Throwable {
		System.out.println("#########" + code);
		String access_Token = service.getAccessToken(code, request);
        
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
