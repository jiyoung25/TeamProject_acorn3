package com.team.project.reserv.dao;

import java.util.List;

import com.team.project.reserv.dto.ReservDto;

public interface ReservDao {
	public void insert(ReservDto dto);
	public List<ReservDto> getReservToSeller(ReservDto dto);
	public int getSellerCount(ReservDto dto);
	public void checkReserv(ReservDto dto);
	public List<ReservDto> getReservToUser(ReservDto dto);
	public int getUserReservCount(ReservDto dto);
	public void updatePaid (ReservDto dto);
	public List<ReservDto> getTime(ReservDto dto);
	public String getUserId(ReservDto dto);
	public String getSellerId(ReservDto dto);
	public void delete(int space_num);
}
