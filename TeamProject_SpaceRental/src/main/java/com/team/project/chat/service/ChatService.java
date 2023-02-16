package com.team.project.chat.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.project.chat.dto.ChattingRoomDto;

public interface ChatService {
	public void insert(ChattingRoomDto dto, HttpSession session);
	public List<ChattingRoomDto> getRoom(ChattingRoomDto dto, HttpServletRequest request);
}
