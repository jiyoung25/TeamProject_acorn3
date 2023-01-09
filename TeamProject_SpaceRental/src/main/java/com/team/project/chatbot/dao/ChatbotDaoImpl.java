package com.team.project.chatbot.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.chatbot.dto.ChatbotDto;

@Repository
public class ChatbotDaoImpl implements ChatbotDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ChatbotDto> getList() {
		List<ChatbotDto> list = session.selectList("chatbot.getList");
		return list;
	}

	@Override
	public ChatbotDto getData(int num) {
		return session.selectOne("chatbot.getData", num);
	}
	
	
}
