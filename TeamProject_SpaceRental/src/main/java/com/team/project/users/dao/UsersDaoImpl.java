package com.team.project.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao {
	@Autowired
	private SqlSession session;

	@Override
	public UsersDto getData(String id) {
		return session.selectOne("users.getData", id);
	}
	
}
