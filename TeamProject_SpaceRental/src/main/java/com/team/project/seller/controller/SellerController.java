package com.team.project.seller.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
				throw new NotUpdateException("????????? ?????? ???????????? ???????????????.");
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
			throw new NotUpdateException("????????? ?????? ???????????? ???????????????.");
		}
		request.setAttribute("space_num", space_num);
		// ?????? space_num ??????
		service.delete(request);
		// ?????? space_num??? ?????? qna ??????
		qnaService.deleteContent2(request);
		// ?????? space_num??? ?????? review ??????
		reviewService.deleteContent2(request);
		// ?????? space_num??? ?????? ??? ??????
		dibService.dibDelete(request);
		// ?????? space_num??? ?????? ?????? ??????
		reservService.delete(request);
		return "redirect:/seller/spacelist"; //?????? ?????? ???????????? ????????? ????????????
	}
	

	//?????? ????????? - ajax
	//json ?????? return ??? ???
	@RequestMapping(value = "/seller/ajax_upload")
	@ResponseBody
	public Map<String, Object> ajaxUpload(SellerDto dto, HttpServletRequest request){		
		//form ?????? dto ??? ????????? ?????????
		//dto : MultipartFile image ??? ????????? ??????.
		//request : imagePath ???????????? ??????, session ????????? id ??????????????? ??????
		//return : { "imagePath" : "/upload/123456img_name.png" } ????????? JSON ??????
		return service.uploadAjaxImage(dto, request);
	}
	
	//ajax ????????? ?????? ????????? ????????????
	@RequestMapping(value = "/users/image_upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> imageUpload(HttpServletRequest request, MultipartFile image){
		
		//???????????? ???????????? ???????????? upload ????????? ???????????? ???????????? Map ??? ???????????? json ????????? ????????????
		return service.saveImage(request, image);
	}
}
