package com.team.project.reserv.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.project.reserv.dto.ReservDto;

public interface ReservService {
	public void insert(ReservDto dto, HttpSession session);
	public List<ReservDto> reservationlist(HttpServletRequest request, HttpSession session);
	public List<ReservDto> reservationOkList(ReservDto dto);
	public List<ReservDto> reservationFailList(ReservDto dto);
}