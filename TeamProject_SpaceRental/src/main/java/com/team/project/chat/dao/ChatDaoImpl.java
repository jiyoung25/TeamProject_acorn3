package com.team.project.chat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.chat.dto.ChattingRoomDto;

@Repository
public class ChatDaoImpl implements ChatDao {
	@Autowired private SqlSession session;

	@Override
	public void insert(ChattingRoomDto dto) {
		session.insert("chattingroom.insert", dto);
	}

	@Override
	public String getSellerId(int space_num) {
		return session.selectOne("chattingroom.getSellerId", space_num);
	}

	@Override
	public List<ChattingRoomDto> getRoom(ChattingRoomDto dto) {
		return session.selectList("chattingroom.getRoom", dto);
	}
}
