package com.team.project.users.service;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team.project.qna.dto.QnaDto;
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
			session.setAttribute("usersCode", dto.getCode());
			session.setAttribute("profile", dto.getProfile());
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
		session.invalidate();
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
	public void getReviewUsersnum(HttpSession session, ReviewDto dto) {
		//로그인된 아이디를 읽어온다.
		String id = (String) session.getAttribute("id");
		//DB 에서 회원 정보를 얻어와서
		UsersDto usersdto = dao.getData(id);
		
		dto.setUsers_num(usersdto.getUsers_num());
	}
	@Override
	public void getQnaUsersnum(HttpSession session, QnaDto dto) {
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

		//이미지를 저장할 실제 경로
		String uploadPath = request.getServletContext().getRealPath("/resources/upload/");
		// upload 폴더가 존재하지 않을경우 만들기 위한 File 객체 생성
		File upload=new File(uploadPath);
		if(!upload.exists()) {//만일 존재 하지 않으면
			upload.mkdir(); //만들어준다.
		}
		try {
			//파일을 저장할 전체 경로를 구성한다.  
			String savePath=uploadPath+saveFileName;
			//임시폴더에 업로드된 파일을 원하는 파일을 저장할 경로에 전송한다.
			mFile.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}

		// json 문자열을 출력하기 위한 Map 객체 생성하고 정보 담기 
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imagePath", "/resources/upload/"+saveFileName);

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
		
		session.setAttribute("profile", dto.getProfile());
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

	@Override
	public String getAccessToken(String authorize_code, HttpServletRequest request) throws Throwable {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			String cpath = request.getContextPath();
			String requesturl = request.getRequestURL().toString();
			
			int cpathnum = requesturl.indexOf(cpath);
			String gopath = requesturl.substring(0, cpathnum);
			System.out.println(gopath);
			
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=2d35e9bcdd28d0e1fb622729f22bab0e"); //본인이 발급받은 key
			sb.append("&redirect_uri="+gopath+"/ubiquitous/users/kakaoLoginCode"); // 본인이 설정한 주소
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	public ModelAndView getUserInfo(String access_Token, HttpServletRequest request, ModelAndView mView) {
		
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			String kakaoId = "kakao_"+element.getAsJsonObject().get("id");
			//JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			//String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = "";
			email = kakao_account.getAsJsonObject().get("email") == null? 
					"" : kakao_account.getAsJsonObject().get("email").getAsString();
		
			UsersDto checkKakaoId = (UsersDto) dao.getData(kakaoId);
			
			//만약, 카카오계정으로 회원가입한 아이디가 존재하면 kakaoExist = "true", 아이디가 없으면 kakaoExist = "false"가 된다.
			//kakaoExist가 "true"이면 로그인 세션을 주고, 로그인이 되었다는 팝업이 뜨고, home으로 리다이렉트 시킨다.
			//kakaoExist가 "false"이면 추가 회원가입 정보 입력 창이 뜬다.
			
			String kakaoExist = "";
			int usersCode = 0;
			if(checkKakaoId == null) {
				kakaoExist = "false";
			} else {
				kakaoExist = "true";
				request.getSession().setAttribute("id", kakaoId);
				request.getSession().setAttribute("usersCode", checkKakaoId.getCode());
				request.getSession().setAttribute("profile", checkKakaoId.getProfile());
			};
			
			//pwd값 생성하기
			String kakaoPwd= "kakao"+UUID.randomUUID();
			System.out.println(kakaoPwd);
			
			System.out.println(kakaoExist);
			mView.addObject("kakaoId", kakaoId);
			mView.addObject("email", email);
			mView.addObject("kakaoExist", kakaoExist);
			mView.addObject("kakaoPwd", kakaoPwd);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mView;
	}
}


