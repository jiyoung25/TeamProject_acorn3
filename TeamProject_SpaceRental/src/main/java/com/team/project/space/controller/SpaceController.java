package com.team.project.space.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.category.dto.CategoryDto;
import com.team.project.category.service.CategoryService;
import com.team.project.space.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService service;
	
	@GetMapping("/space/list")
	public String spaceList(HttpServletRequest request, int cate_num) {
		service.getSpaceList(request, cate_num);
		
		return "space/list";
	}
}