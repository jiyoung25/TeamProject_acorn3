package com.team.project.reserv.dto;

import org.apache.ibatis.type.Alias;

@Alias("reservDto")
public class ReservDto {
	private int reserv_num; //예약 번호
	private String users_id;//구매자 아이디
	private int space_num; //-- 공간 글 번호
	private String reserv_date; //예약 날짜
	private String reserv_time; //예약 시간
	private String reserv_comment; //예약시 판매자에게 남길 말 (요청사항)
	private int reserv_count; //예약하는 사람 수
	
	public ReservDto() {
		
	}

	public ReservDto(int reserv_num, String users_id, int space_num, String reserv_date, String reserv_time,
			String reserv_comment, int reserv_count) {
		super();
		this.reserv_num = reserv_num;
		this.users_id = users_id;
		this.space_num = space_num;
		this.reserv_date = reserv_date;
		this.reserv_time = reserv_time;
		this.reserv_comment = reserv_comment;
		this.reserv_count = reserv_count;
	}

	public int getReserv_num() {
		return reserv_num;
	}

	public void setReserv_num(int reserv_num) {
		this.reserv_num = reserv_num;
	}

	public String getUsers_id() {
		return users_id;
	}

	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}

	public int getSpace_num() {
		return space_num;
	}

	public void setSpace_num(int space_num) {
		this.space_num = space_num;
	}

	public String getReserv_date() {
		return reserv_date;
	}

	public void setReserv_date(String reserv_date) {
		this.reserv_date = reserv_date;
	}

	public String getReserv_time() {
		return reserv_time;
	}

	public void setReserv_time(String reserv_time) {
		this.reserv_time = reserv_time;
	}

	public String getReserv_comment() {
		return reserv_comment;
	}

	public void setReserv_comment(String reserv_comment) {
		this.reserv_comment = reserv_comment;
	}

	public int getReserv_count() {
		return reserv_count;
	}

	public void setReserv_count(int reserv_count) {
		this.reserv_count = reserv_count;
	}
}
