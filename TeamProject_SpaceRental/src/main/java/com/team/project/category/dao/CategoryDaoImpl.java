package com.team.project.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.category.dto.CategoryDto;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<CategoryDto> getCategoryList() {
		return session.selectList("category.getCategoryList");
	}
	
	@Override
	public List<CategoryDto> getSpaceAllList(CategoryDto dto) {
		return session.selectList("category.getSpaceAllList", dto);
	}

	@Override
	public List<CategoryDto> getSpaceList(CategoryDto dto) {
		return session.selectList("category.getSpaceList", dto);
	}

}
