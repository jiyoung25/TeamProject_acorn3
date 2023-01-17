package com.team.project.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{

	@Autowired
	private SqlSession session;
	
	//해당 아이디가 존재하는지 여부를 리턴하는 메소드
	@Override
	public boolean isExist(String inputId) {
		//dto 를 이용해서 select 해보면 null 혹은 null 이 아니다.
		UsersDto dto = session.selectOne("users.getData", inputId);
		if(dto==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto  );
	}

	@Override
	public UsersDto getData(String id) {
		return session.selectOne("users.getData", id);
	}

	//비밀번호 수정
	@Override
	public void updatePwd(UsersDto dto) {
		session.update("users.updatePwd", dto);
	}
	
	//이메일과 프로필 수정
	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}

	//아이디를 이용한 삭제
	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}
}