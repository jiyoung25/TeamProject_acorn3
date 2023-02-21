package com.team.project.space.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.team.project.category.dto.CategoryDto;
import com.team.project.space.dto.SpaceDto;

public interface SpaceDao {
	public List<SpaceDto> getSpaceList(SpaceDto dto);
	public List<SpaceDto> getSpaceAllList(SpaceDto dto);
	public int getCount(SpaceDto dto); //카테고리별 전체 row의 수
	public int getAllCount(); //전체 목록의 row수
	public SpaceDto getData(int space_num);
	public List<SpaceDto> getRecentReviewList();
}
