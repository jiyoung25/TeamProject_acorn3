package com.team.project.chatbot.dao;

import java.util.List;

import com.team.project.chatbot.dto.ChatbotDto;

public interface ChatbotDao {
	public List<ChatbotDto> getList();
	public ChatbotDto getData(int num);
}
