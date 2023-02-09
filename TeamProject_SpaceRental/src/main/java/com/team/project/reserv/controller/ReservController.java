package com.team.project.reserv.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/seller/reservation/reservationlist")
	public String reservationlist(HttpServletRequest request, HttpSession session, ReservDto dto) {
		service.reservationlist(request, session, dto);
		
		return "seller/reservation/reservationlist";
	}
	
	@RequestMapping("/seller/reservation/reservationlist2")
	public String reservationlist2(HttpServletRequest request, HttpSession session, ReservDto dto) {
		service.reservationlist(request, session, dto);
		
		return "seller/reservation/reservationlist2";
	}
	
	@RequestMapping("/seller/reservation/check-reserv")
	@ResponseBody
	public String checkReserv(ReservDto dto, String num, String isReservOk){
		dto.setReserv_num(Integer.parseInt(num));
		dto.setCheckReserv(isReservOk);
		service.checkReserv(dto);
		return "seller/reservation/check-reserv";
	}
	
	//ajax로 reservationlist받는 것
	@RequestMapping("/seller/reservation/getreservationlist")
	@ResponseBody
	public List<ReservDto> getreservationlist(HttpServletRequest request, HttpSession session, ReservDto dto) {
		return service.reservationlist(request, session, dto);
	}
}
