package com.team.project.space.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.team.project.dib.dto.DibDto;
import com.team.project.dib.service.DibService;
import com.team.project.interceptor.Auth;
import com.team.project.interceptor.Auth.Role;
import com.team.project.qna.service.QnaService;
import com.team.project.reserv.service.ReservService;
import com.team.project.review.dto.ReviewDto;
import com.team.project.review.service.ReviewService;
import com.team.project.seller.dto.SellerDto;
import com.team.project.seller.service.SellerService;
import com.team.project.space.dto.SpaceDto;
import com.team.project.space.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService service;
	@Autowired
	private DibService dibService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private SellerService sellerService;
	@Autowired
	private ReservService reservService;
	
	@GetMapping("/space/list")
	public String spaceList(HttpServletRequest request) {
		service.getSpaceList(request);
		
		return "space/list";
	}
	
	@GetMapping("/space/detail")
	public ModelAndView detail(ModelAndView mView, HttpServletRequest request, DibDto dto,HttpSession session, SpaceDto spaceDto, ReviewDto reviewDto) {
		service.getDay(request);
		service.getSpaceData(mView, spaceDto, request);
		
		if(session.getAttribute("id")!=null) {
			dto.setUsers_id((String)session.getAttribute("id"));
			dto.setSpace_num(dto.getSpace_num());
			dibService.dibGetDetailData(dto, request);
			reviewService.possibleReview(reviewDto, request);
		}
		
		reviewService.getList(request, dto.getSpace_num());
		qnaService.getQnaList(request, dto.getSpace_num());
		
		return mView;
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("/space/reviewDelete")
	public String reviewDelete(int review_num, HttpServletRequest request, int cate_num, int space_num, RedirectAttributes redirectAttributes) {
		// 해당 reveiw_num을 삭제한다.
		reviewService.deleteContent(review_num, request);
		// redirect에 파라미터 전해주기
		redirectAttributes.addAttribute("cate_num",cate_num);
		redirectAttributes.addAttribute("space_num", space_num);
		
		return "redirect:/space/detail";
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("/space/qnaDelete")
	public String qnaDelete(int num, HttpServletRequest request, int cate_num, int space_num, RedirectAttributes redirectAttributes) {
		// 해당 num을 삭제한다.
		qnaService.deleteContent(num, request);
		// redirect에 파라미터 전해주기
		redirectAttributes.addAttribute("cate_num",cate_num);
		redirectAttributes.addAttribute("space_num", space_num);
		
		return "redirect:/space/detail";
	}
	
	@RequestMapping("/space/detail1")
	public String detail1() {
		return "space/detail1";
	}
	
	@Auth(role = Role.ADMIN)
	@RequestMapping("/space/spaceDelete")
	public String spaceDelete(HttpServletRequest request, int cate_num, int space_num, RedirectAttributes redirectAttributes) {
		request.setAttribute("space_num", space_num);
		// 해당 num을 삭제한다.
		sellerService.delete(request);
		// 해당 space_num에 대한 qna 삭제
		qnaService.deleteContent2(request);
		// 해당 space_num에 대한 review 삭제
		reviewService.deleteContent2(request);
		// 해당 space_num에 대한 찜 삭제
		dibService.dibDelete(request);
		// 해당 space_num에 대한 예약 삭제
		reservService.delete(request);
		// redirect에 파라미터 전해주기
		redirectAttributes.addAttribute("cate_num",cate_num);
		
		return "redirect:/space/list";
	}
	

	
	@RequestMapping("/space/navigator")
	public String navigator(int cate_num) {
		return "space/navigator";
	}
	
	@GetMapping("/space/marker")
	@ResponseBody
	public List<SellerDto> maker(HttpServletRequest request, int cate_num){
		return sellerService.getAddr(request, cate_num);
	}
	

	@PostMapping("/space/uploadImage")
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws IOException {
		return service.uploadImage(request, response, multiFile);
	}
}
