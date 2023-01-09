package com.team.project.chatbot.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.chatbot.dao.ChatbotDao;
import com.team.project.chatbot.dto.ChatbotDto;

@Service
public class ChatbotServiceImpl implements ChatbotService {
	@Autowired
	private ChatbotDao dao;

	@Override
	public ModelAndView getQnaList(ModelAndView mView) {
		mView.addObject("qnaList", dao.getList());
		
		return mView;
	}

	@Override
	public ChatbotDto getQna(int num) {
		return dao.getData(num);
	}
}
