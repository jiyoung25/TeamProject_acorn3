package com.team.project.category.dao;

import java.util.List;

import com.team.project.category.dto.CategoryDto;
import com.team.project.space.dto.SpaceDto;

public interface CategoryDao {
	public List<CategoryDto> getCategoryList();
}
