package com.team.project.chatbot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.project.chatbot.service.ChatbotService;

@Controller
public class ChatbotController {
	@Autowired
	private ChatbotService service;
	
	@RequestMapping(value = "/chatbot/qna", method = RequestMethod.GET)
	public String answer(int num, HttpServletRequest request) {
		
		request.setAttribute("chatbotDto", service.getQna(num));
		
		return "chatbot/qna";
	}

}
