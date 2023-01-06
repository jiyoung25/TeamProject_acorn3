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
		// TODO Auto-generated method stub
		return null;
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
	public void loginProcess(UsersDto dto, HttpSession session, HttpServletResponse response) {
		//입력한 정보가 맞는지 여부
		boolean isValid=false;
		//아이디를 이용해서 회원 정보를 얻어온다.
		UsersDto resultDto = dao.getData(dto.getId());
		//만일 select 된 회원 정보가 존재하고
		if(resultDto != null) {
			//Bcrypt 클래스의 static 메소드를 이용해서 입력한 비밀번호와 암호화 해서 
			//저장된 비밀번호 일치 여부를 알아내야한다.
			isValid = BCrypt.checkpw(dto.getPwd(), resultDto.getPwd());
		}
		
		//만일 유효한 정보이면 
		if(isValid) {
			//로그인 처리를 한다.
			session.setAttribute("id", resultDto.getId());			
		}
		//로그인 정보를 저장하기로 했는지 확인해서 저장 하기로 했다면 쿠키로 응답한다.
		String isSave=dto.getIsSave();
		if(isSave == null){//체크 박스를 체크 안했다면
			//저장된 쿠키 삭제 
			Cookie idCook=new Cookie("savedId", dto.getId());
			idCook.setMaxAge(0);//삭제하기 위해 0 으로 설정 
			response.addCookie(idCook);

			Cookie pwdCook=new Cookie("savedPwd", dto.getNewPwd());
			pwdCook.setMaxAge(0);
			response.addCookie(pwdCook);
		}else{//체크 박스를 체크 했다면 
			//아이디와 비밀번호를 쿠키에 저장
			Cookie idCook=new Cookie("savedId", dto.getId());
			idCook.setMaxAge(60*60*24);//하루동안 유지
			response.addCookie(idCook);

			Cookie pwdCook=new Cookie("savedPwd", dto.getPwd());
			pwdCook.setMaxAge(60*60*24);
			response.addCookie(pwdCook);
		}
	}

	@Override
	public void getInfo(HttpSession session, ModelAndView mView) {
		//로그인된 아이디를 읽어온다.
		String id = (String) session.getAttribute("id");
		//DB 에서 회원 정보를 얻어와서
		UsersDto dto = dao.getData(id);
		//ModelAndView 객체에 담아준다.
		mView.addObject("dto", dto);
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












