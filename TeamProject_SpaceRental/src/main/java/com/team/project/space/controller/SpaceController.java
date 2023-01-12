package com.team.project.space.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.team.project.dib.dto.DibDto;
import com.team.project.dib.service.DibService;
import com.team.project.qna.service.QnaService;
import com.team.project.space.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService service;
	@Autowired
	private DibService dibService;
  @Autowired
	private QnaService service2;
	
	@GetMapping("/space/list")
	public String spaceList(HttpServletRequest request, int cate_num, int space_num) {
		service.getSpaceList(request, cate_num);
		request.setAttribute("cate_num", cate_num);
		request.setAttribute("space_num", space_num);
		
		return "space/list";
	}
	
	@GetMapping("/space/detail")
	public String detail(HttpServletRequest request, int cate_num, int space_num, DibDto dto,HttpSession session) {
		service.getDay(request);
		request.setAttribute("cate_num", cate_num);
    request.setAttribute("space_num", space_num);
    
		service.getSpaceData(request, space_num);
		
		if(session.getAttribute("id")!=null) {
			dto.setUsers_id((String)session.getAttribute("id"));
			dto.setSpace_num(space_num);
			dibService.dibGetDetailData(dto, request);
		}
		service2.getList(request);
		
		return("space/detail");
	}
	
	@GetMapping("/space/detail1")
	public String detail1() {
		return("space/detail1");
	}
}
