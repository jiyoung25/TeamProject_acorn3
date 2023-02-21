package com.team.project.space.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int getCount(SpaceDto dto) {
		return session.selectOne("space.getCount", dto);
	}

	@Override
	public int getAllCount() {
		return session.selectOne("space.getAllCount");
	}

	@Override
	public SpaceDto getData(int space_num) {
		return session.selectOne("space.getData", space_num);
	}

	@Override
	public List<SpaceDto> getRecentReviewList() {
		return session.selectList("space.getRecentReviewList");
	}
}
