package com.team.project.space.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.project.space.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService service;
	
	@GetMapping("/space/list")
	public String spaceList(HttpServletRequest request, int cate_num) {
		service.getSpaceList(request, cate_num);
		request.setAttribute("cate_num", cate_num);
		
		return "space/list";
	}
	
	@GetMapping("/space/detail")
	public String detail(HttpServletRequest request, int cate_num) {
		service.getDay(request);
		request.setAttribute("cate_num", cate_num);
        
		return("space/detail");
	}
}
