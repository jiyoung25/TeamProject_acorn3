package com.team.project.chat.dto;

import org.apache.ibatis.type.Alias;

@Alias("chattingRoomDto")
public class ChattingRoomDto {
	private int room_num;
	private String seller_id;
	private String user_id;
	private String roomName;
	private int space_num;
	
	public ChattingRoomDto() {
		
	}
	
	public ChattingRoomDto(int room_num, String seller_id, String user_id, String roomName, int space_num) {
		super();
		this.room_num = room_num;
		this.seller_id = seller_id;
		this.user_id = user_id;
		this.roomName = roomName;
		this.space_num = space_num;
	}
	public int getroom_num() {
		return room_num;
	}
	public void setroom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getSpace_num() {
		return space_num;
	}
	public void setSpace_num(int space_num) {
		this.space_num = space_num;
	}
}
