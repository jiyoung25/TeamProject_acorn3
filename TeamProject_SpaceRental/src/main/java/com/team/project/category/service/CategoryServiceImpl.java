package com.team.project.category.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.category.dao.CategoryDao;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao dao;

	@Override
	public ModelAndView getCategoryList(ModelAndView mView) {
		mView.addObject("categoryList", dao.getList());
		return mView;
	}
}
