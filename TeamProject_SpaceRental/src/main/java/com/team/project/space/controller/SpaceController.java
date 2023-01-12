package com.team.project.space.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.project.qna.service.QnaService;
import com.team.project.space.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService service;
	@Autowired
	private QnaService service2;
	
	@GetMapping("/space/list")
	public String spaceList(HttpServletRequest request, int cate_num) {
		service.getSpaceList(request, cate_num);
		request.setAttribute("cate_num", cate_num);
		
		return "space/list";
	}
	
	@GetMapping("/space/detail")
	public String detail(HttpServletRequest request, int cate_num, int space_num) {
		service.getDay(request);
		request.setAttribute("cate_num", cate_num);
		request.setAttribute("space_num", space_num);
		service2.getList(request);
		
		return("space/detail");
	}
}
