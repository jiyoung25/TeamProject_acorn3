package com.team.project.seller.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.dib.service.DibService;
import com.team.project.exception.NotUpdateException;
import com.team.project.interceptor.Auth;
import com.team.project.interceptor.Auth.Role;
import com.team.project.qna.service.QnaService;
import com.team.project.reserv.service.ReservService;
import com.team.project.review.service.ReviewService;
import com.team.project.seller.dto.SellerDto;
import com.team.project.seller.service.SellerService;
import com.team.project.users.service.UsersService;

@Controller
public class SellerController {
	@Autowired
	private SellerService service;
	@Autowired
	private UsersService usersService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private DibService dibService;
	@Autowired
	private ReservService reservService;
	
	@Value("${file.location}")
	private String fileLocation;
	
	@GetMapping(
			value="/seller/images/{imageName}",
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
	
	@Auth(role = Role.SELLER)
	@RequestMapping("/seller/spacelist")
	public ModelAndView list(ModelAndView mView, HttpServletRequest request, HttpSession session) {
		service.getUsersNum(request, session);
		service.getList(mView, request);
		mView.setViewName("seller/spacelist");
		return mView;
	}
	
	@Auth(role = Role.SELLER)
	@RequestMapping("/seller/sellerReview")
	public ModelAndView sellerReview(ModelAndView mView, HttpServletRequest request) {
		service.getReviewList(mView, request);
		mView.setViewName("seller/sellerReview");
		return mView;
	}
	
	@Auth(role = Role.SELLER)
	@RequestMapping("/seller/sellerQna")
	public ModelAndView sellerQna(ModelAndView mView, HttpServletRequest request) {
		service.getQnaList(mView, request);
		mView.setViewName("seller/sellerQna");
		return mView;
	}
	
	@RequestMapping("/seller/sellerQnaDetail")
	public String qnadetail(HttpServletRequest request) {
		qnaService.sellerQnaDetail(request);
		return "seller/sellerQnaDetail";
	}
	
	@RequestMapping("/seller/sellerReviewDetail")
	public String reviewdetail(HttpServletRequest request) {
		reviewService.sellerReviewDetail(request);
		return "seller/sellerReviewDetail";
	}
	
	@Auth(role = Role.SELLER)
	@RequestMapping("/seller/spaceinfo")
	public String spaceinfo(HttpSession session,ModelAndView mView) {
		usersService.getInfo(session, mView);
		return "seller/spaceinfo";
	}
	
	@Auth(role = Role.SELLER)
	@RequestMapping("/seller/insert")
	public String insert(SellerDto dto, HttpServletRequest request, HttpSession session) {
		service.getUsersNum(request, session);
		dto.setUsers_num((Integer)request.getAttribute("users_num"));
		service.insert(dto, request);
		
		return "seller/insert";
	}
	
	@Auth(role = Role.SELLER)
	@RequestMapping("/seller/spaceupdate")
	public String spaceUpdate(HttpServletRequest request, HttpSession session, ModelAndView mView) {
		if(session.getAttribute("id")!=null) {
			SellerDto dto = service.getData(request);
			int spaceOwner = dto.getUsers_num();
			int user = service.getUsersNum(request, session);
			
			if(spaceOwner != user) {
				throw new NotUpdateException("타인의 방을 수정하지 말아주세요.");
			}
			
			usersService.getInfo(session, mView);
		}
		return "seller/spaceupdate";
	}
	
	@Auth(role = Role.SELLER)
	@RequestMapping("/seller/update")
	public String update(SellerDto dto, HttpServletRequest request, HttpSession session) {
		service.update(dto, request);
		
		return "seller/update";		
	}
	
	@Auth(role = Role.SELLER)
	@RequestMapping("/seller/delete")
	public String delete(int space_num, HttpServletRequest request) {
		SellerDto dto = service.getData(request);
		int spaceOwner = dto.getUsers_num();
		int user = service.getUsersNum(request, request.getSession());
		
		if(spaceOwner != user) {
			throw new NotUpdateException("타인의 방을 삭제하지 말아주세요.");
		}
		request.setAttribute("space_num", space_num);
		// 해당 space_num 삭제
		service.delete(request);
		// 해당 space_num에 대한 qna 삭제
		qnaService.deleteContent2(request);
		// 해당 space_num에 대한 review 삭제
		reviewService.deleteContent2(request);
		// 해당 space_num에 대한 찜 삭제
		dibService.dibDelete(request);
		// 해당 space_num에 대한 예약 삭제
		reservService.delete(request);
		return "redirect:/seller/spacelist"; //다시 한번 물어보는 것으로 수정예정
	}
	

	//사진 업로드 - ajax
	//json 으로 return 할 것
	@RequestMapping(value = "/seller/ajax_upload")
	@ResponseBody
	public Map<String, Object> ajaxUpload(SellerDto dto, HttpServletRequest request){		
		//form 에서 dto 로 데이터 받아옴
		//dto : MultipartFile image 를 가지고 있다.
		//request : imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		//return : { "imagePath" : "/upload/123456img_name.png" } 형식의 JSON 응답
		return service.uploadAjaxImage(dto, request);
	}
	
	//ajax 프로필 사진 업로드 요청처리
	@RequestMapping(value = "/users/image_upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> imageUpload(HttpServletRequest request, MultipartFile image){
		
		//서비스를 이용해서 이미지를 upload 폴더에 저장하고 리턴되는 Map 을 리턴해서 json 문자열 응답하기
		return service.saveImage(request, image);
	}
}
