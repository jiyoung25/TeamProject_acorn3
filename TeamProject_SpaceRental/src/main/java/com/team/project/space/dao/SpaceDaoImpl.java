package com.team.project.space.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.category.dto.CategoryDto;
import com.team.project.space.dto.SpaceDto;

@Repository
public class SpaceDaoImpl implements SpaceDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<SpaceDto> getSpaceList(SpaceDto dto) {
		return session.selectList("space.getSpaceList", dto);
	}
	
	@Override
	public List<SpaceDto> getSpaceAllList(SpaceDto dto) {
		return session.selectList("space.getSpaceAllList", dto);
	}

	@Override
	public int getCount(int cate_num) {
		return session.selectOne("space.getCount", cate_num);
	}

	@Override
	public int getAllCount() {
		return session.selectOne("space.getAllCount");
	}
}
