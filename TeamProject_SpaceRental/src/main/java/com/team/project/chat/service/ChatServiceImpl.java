package com.team.project.chat.service;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.project.chat.dao.ChatDao;
import com.team.project.chat.dto.ChattingRoomDto;

@Service
public class ChatServiceImpl implements ChatService {
	@Autowired private ChatDao dao;

	@Override //space_num값만 받아오면 된다.
	public void insert(ChattingRoomDto dto, HttpSession session) {
		dto.setSeller_id(dao.getSellerId(dto.getSpace_num()));
		dto.setRoomName(dto.getSeller_id()+"판매자님과의 1:1 QnA방");
		dto.setUser_id((String)session.getAttribute("id"));
		
		dao.insert(dto);
	}

	@Override
	public List<ChattingRoomDto> getRoom(ChattingRoomDto dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		dto.setSeller_id(dao.getSellerId(dto.getSpace_num()));
		dto.setUser_id((String)session.getAttribute("id"));
		
		int room_num = dto.getroom_num();
		request.setAttribute("room_num", room_num);
		
		return dao.getRoom(dto);
	}
}
