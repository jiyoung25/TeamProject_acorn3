package com.team.project.category.dao;

import java.util.List;

import com.team.project.category.dto.CategoryDto;

public interface CategoryDao {
	public List<CategoryDto> getCategoryList();
	public List<CategoryDto> getSpaceAllList(CategoryDto dto);
	public List<CategoryDto> getSpaceList(CategoryDto dto);
}
