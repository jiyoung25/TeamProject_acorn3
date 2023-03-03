package com.team.project.dib.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.dib.dto.DibDto;

@Repository
public class DibDaoImpl implements DibDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(DibDto dto) {
		session.insert("dib.insert", dto);
	}

	@Override
	public void delete(int dibson_num) {
		session.delete("dib.delete", dibson_num);
	}
	
	@Override
	public void delete2(int space_num) {
		session.delete("dib.delete2", space_num);
	}

	@Override
	public List<DibDto> getData(DibDto dto) {
		return session.selectList("dib.getData", dto);
	}

	@Override
	public DibDto getDetailData(DibDto dto) {
		return session.selectOne("dib.getDetailData", dto);
	}

	@Override
	public int getCount(String id) {
		return session.selectOne("dib.getCount", id);
	}

	@Override
	public String getUserId(int num) {
		return session.selectOne("dib.getUserId", num);
	}

}
