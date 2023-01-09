package com.team.project.category.dao;

import java.util.List;

import com.team.project.category.dto.CategoryDto;

public interface CategoryDao {
	public List<CategoryDto> getList();
	public CategoryDto getData(int num);
}
