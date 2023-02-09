package com.team.project.reserv.dao;

import java.util.List;

import com.team.project.reserv.dto.ReservDto;

public interface ReservDao {
	public void insert(ReservDto dto);
	public List<ReservDto> getReservToSeller(ReservDto dto);
	public int getSellerCount(ReservDto dto);
	public void checkReserv(ReservDto dto);
}
