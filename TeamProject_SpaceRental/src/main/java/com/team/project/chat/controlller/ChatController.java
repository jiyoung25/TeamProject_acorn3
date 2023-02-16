package com.team.project.chat.controlller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.project.chat.dto.ChattingRoomDto;
import com.team.project.chat.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	@RequestMapping("/chat/chat")
	public String chat() {
		return "chat/chat";
	}
	
	// 방 페이지
	@RequestMapping("/chat/room")
	public String room() {
		return "chat/room";
	}
	
	//방 생성하기
	@RequestMapping("/chat/createRoom")
	@ResponseBody
	public void createRoom(ChattingRoomDto dto, HttpSession session){
		service.insert(dto, session);
	}
	
	//방 정보가져오기
	@RequestMapping("/chat/getRoom")
	@ResponseBody
	public List<ChattingRoomDto> getRoom(HttpServletRequest request, ChattingRoomDto dto){
		return service.getRoom(dto, request);
	}
	
	//채팅방
	@RequestMapping("/chat/moveChatting")
	public String chatting(ChattingRoomDto dto, HttpServletRequest request) {
		service.getRoom(dto, request);
		return "chat/moveChatting";
	}
}
