package com.team.project.space.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.project.dib.dto.DibDto;
import com.team.project.dib.service.DibService;
import com.team.project.qna.service.QnaService;
import com.team.project.review.service.ReviewService;
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
	
	@GetMapping("/space/list")
	public String spaceList(HttpServletRequest request) {
		service.getSpaceList(request);
		
		return "space/list";
	}
	
	@GetMapping("/space/detail")
	public String detail(HttpServletRequest request,int cate_num, int space_num, DibDto dto,HttpSession session) {
		service.getDay(request);
		service.getSpaceData(request, space_num);
		
		if(session.getAttribute("id")!=null) {
			dto.setUsers_id((String)session.getAttribute("id"));
			dto.setSpace_num(space_num);
			dibService.dibGetDetailData(dto, request);
		}
		
		reviewService.getList(request, space_num);
		qnaService.getQnaList(request, space_num);
		
		return("space/detail");
	}
	
	@GetMapping("/space/detail1")
	public String detail1() {
		return("space/detail1");
	}
	
	@RequestMapping("/space/category")
	public String category() {
		return("space/category");
	}
}
