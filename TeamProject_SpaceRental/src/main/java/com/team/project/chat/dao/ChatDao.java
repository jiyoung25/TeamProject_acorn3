package com.team.project.chat.dao;

import java.util.List;

import com.team.project.chat.dto.ChattingRoomDto;

public interface ChatDao {
	public String getSellerId(int space_num);
	public void insert(ChattingRoomDto dto);
	public List<ChattingRoomDto> getRoom(ChattingRoomDto dto);
}
