package com.team.project.category.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.category.dto.CategoryDto;

public interface CategoryService {
	public ModelAndView getCategory(ModelAndView mView);
}
