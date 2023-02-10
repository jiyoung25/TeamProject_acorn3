package com.team.project.reserv.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.project.reserv.dto.ReservDto;

public interface ReservService {
	public void insert(ReservDto dto, HttpSession session);
	public List<ReservDto> reservationlistToSeller(HttpServletRequest request, HttpSession session, ReservDto dto);
	public void checkReserv(ReservDto dto);
	public List<ReservDto> reservationlistToUser(HttpServletRequest request, HttpSession session, ReservDto dto);
	public void updatePaid(ReservDto dto);
	public List<ReservDto> getReservTime(String reserv_date);
}