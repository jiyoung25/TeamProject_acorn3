package com.team.project.users.service;


import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.review.dto.ReviewDto;
import com.team.project.users.dao.UsersDao;
import com.team.project.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersDao dao;
	
	@Value("${file.location}")
	private String fileLocation;
	
	@Override
	public Map<String, Object> isExistId(String inputId) {
		//Map 객체를 생성해서 
		Map<String, Object> map=new HashMap<String, Object>();
		//isExist 라는 키값으로 아이디가 존재하는지 여부를 담고
		map.put("isExist", dao.isExist(inputId));
		//Map 객체를 리턴해 준다. 
		return map;
	}
	
	//회원 한명의 정보를 추가하는 메소드
	@Override
	public void addUser(UsersDto dto) {
		//가입시 입력한 비밀번호를 읽어와서
		String pwd = dto.getPwd();
		//암호화 한후에
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(pwd);
		//dto 에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		//암호화된 비밀번호가 들어 있는 dto 를 dao 에 전달해서 새로운 회원 정보를 추가한다.
		dao.insert(dto);
	}
	
	//로그인 처리를 하는 메소드
	@Override
	public void login(String id, String inputPwd, HttpSession session, HttpServletRequest request, ModelAndView mView, HttpServletResponse response) {
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
			String remember = request.getParameter("remember");
			System.out.println(remember);
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

	@Override
	public void getInfo(HttpSession session, ModelAndView mView) {
		//로그인된 아이디를 읽어온다.
		String id = (String) session.getAttribute("id");
		//DB 에서 회원 정보를 얻어와서
		UsersDto dto = dao.getData(id);
		//ModelAndView 객체에 담아준다.
		mView.addObject("dto", dto);
		mView.addObject("userCode", dto.getCode());
	}
	
	@Override
	public void getInfo2(HttpSession session, ReviewDto dto) {
		//로그인된 아이디를 읽어온다.
		String id = (String) session.getAttribute("id");
		//DB 에서 회원 정보를 얻어와서
		UsersDto usersdto = dao.getData(id);
		
		dto.setUsers_num(usersdto.getUsers_num());
	}

	@Override
	public void updateUserPwd(HttpSession session, UsersDto dto, ModelAndView mView) {
	      //세션 영역에서 로그인된 아이디 읽어오기
	      String id=(String)session.getAttribute("id");
	      //DB 에 저장된 회원정보 얻어오기
	      UsersDto resultDto=dao.getData(id);
	      //DB 에 저장된 암호화된 비밀 번호
	      String encodedPwd=resultDto.getPwd();
	      //클라이언트가 입력한 비밀번호
	      String inputPwd=dto.getPwd();
	      //두 비밀번호가 일치하는지 확인
	      boolean isValid=BCrypt.checkpw(inputPwd, encodedPwd);
	      //만일 일치 한다면
	      if(isValid) {
	         //새로운 비밀번호를 암호화 한다.
	         BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
	         String encodedNewPwd=encoder.encode(dto.getNewPwd());
	         //암호화된 비밀번호를 dto 에 다시 넣어준다.
	         dto.setNewPwd(encodedNewPwd);
	         //dto 에 로그인된 아이디도 넣어준다.
	         dto.setId(id);
	         //dao 를 이용해서 DB 에 수정 반영한다.
	         dao.updatePwd(dto);
	         //로그아웃 처리
	         session.removeAttribute("id");
	      }
	      //작업의 성공여부를 ModelAndView 객체에 담아 놓는다
	      //(결국 HttpServletRequest 에 담긴다)
	      mView.addObject("isSuccess", isValid);
	      //로그인된 아이디도 담아준다.
	      mView.addObject("id", id);
	}

	@Override
	public Map<String, Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		//업로드된 파일에 대한 정보를 MultipartFile 객체를 이용해서 얻어낼수 있다.	

		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//upload 폴더에 저장할 파일명을 직접구성한다.
		// 1234123424343xxx.jpg
		String saveFileName=System.currentTimeMillis()+orgFileName;

		// 이미지를 저장할 실제 경로 
		String realPath=fileLocation;
		// upload 폴더가 존재하지 않을경우 만들기 위한 File 객체 생성
		File upload=new File(realPath);
		if(!upload.exists()) {//만일 존재 하지 않으면
			upload.mkdir(); //만들어준다.
		}
		try {
			//파일을 저장할 전체 경로를 구성한다.  
			String savePath=realPath+File.separator+saveFileName;
			//임시폴더에 업로드된 파일을 원하는 파일을 저장할 경로에 전송한다.
			mFile.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}

		// json 문자열을 출력하기 위한 Map 객체 생성하고 정보 담기 
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imagePath", saveFileName);

		return map;
	}

	@Override
	public void updateUser(UsersDto dto, HttpSession session) {
		//수정할 회원의 아이디
		String id = (String)session.getAttribute("id");
		//dto 에 id 도 넣어준다.
		dto.setId(id);
		
		//만일 프로필 이미지를 등록하지 않은 상태면
		if(dto.getProfile().equals("empty")) {
			//users 테이블의 profile 칼럼을 null 인 상태로 유지하기 위해 profile 에 null 을 넣어준다.
			dto.setProfile(null);
		}
		dao.update(dto);
	}

	@Override
	public void deleteUser(HttpSession session, ModelAndView mView) {
		//로그인된 아이디를 얻어와서
		String id = (String)session.getAttribute("id");
		//해당 정보를 DB 에서 삭제하고
		dao.delete(id);
		//로그아웃 처리도 한다.
		session.removeAttribute("id");
		//ModelAndView 객체에 탈퇴한 회원의 아이디를 담아준다.
		mView.addObject("id", id);
	}

}


