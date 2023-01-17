package com.team.project.reserv.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.project.reserv.dto.ReservDto;
import com.team.project.reserv.service.ReservService;

@Controller
public class ReservController {
	@Autowired
	private ReservService service;
	
	@RequestMapping("/space/reservation")
	public String reservation(HttpServletRequest request, ReservDto dto, HttpSession session) {
		service.insert(dto, session);
		return "space/reservation";
	}
	
	@RequestMapping("/seller/reservationlist")
	public String reservationlist(HttpServletRequest request, HttpSession session) {
		service.reservationlist(request, session);
		
		return "seller/reservationlist";
	}
}
