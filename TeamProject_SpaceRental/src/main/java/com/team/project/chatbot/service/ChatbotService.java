package com.team.project.chatbot.service;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.chatbot.dto.ChatbotDto;

public interface ChatbotService {
	public ModelAndView getQnaList(ModelAndView mView);
	public ChatbotDto getQna(int num);
}
