package com.team.project.category.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.category.dao.CategoryDao;
import com.team.project.space.dto.SpaceDto;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao dao;
	
	@Override
	public ModelAndView getCategory(ModelAndView mView) {
		return mView.addObject("category", dao.getCategoryList());
	}
}
