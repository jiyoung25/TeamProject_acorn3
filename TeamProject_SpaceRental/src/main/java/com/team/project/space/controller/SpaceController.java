package com.team.project.space.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.category.dto.CategoryDto;
import com.team.project.category.service.CategoryService;

@Controller
public class SpaceController {
	@Autowired
	private CategoryService service;
	
	@GetMapping("/space/list")
	public ModelAndView spaceList(ModelAndView mView, CategoryDto dto, int num) {
		dto.setCate_num(num);
		service.getSpaceList(mView, dto);
		mView.setViewName("space/list");
		
		return mView;
	}
}