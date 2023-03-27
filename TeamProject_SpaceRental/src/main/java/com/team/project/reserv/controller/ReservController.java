package com.team.project.reserv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.project.exception.NotUpdateException;
import com.team.project.interceptor.Auth;
import com.team.project.interceptor.Auth.Role;
import com.team.project.reserv.dto.ReservDto;
import com.team.project.reserv.service.ReservService;

@Controller
public class ReservController {
	@Autowired
	private ReservService service;
	
	@Auth(role = Role.USER)
	@RequestMapping("/space/reservation")
	public String reservation(HttpServletRequest request, ReservDto dto, HttpSession session) {
		service.insert(dto, session);
		return "space/reservation";
	}
	
	@RequestMapping("/seller/reservation/reservationlist")
	public String reservationlistToSeller(HttpServletRequest request, HttpSession session, ReservDto dto) {
		service.reservationlistToSeller(request, session, dto);
		return "seller/reservation/reservationlist";
	}
	
	@RequestMapping("/seller/reservation/check-reserv")
	@ResponseBody
	public String checkReserv(ReservDto dto, String num, String isReservOk, HttpSession session){
		dto.setReserv_num(Integer.parseInt(num));
		String sellerId = service.getSellerId(dto);
		String userId = service.getUserId(dto);
		String sessionId = (String)session.getAttribute("id");
		if(!sellerId.equals(sessionId)&&!userId.equals(sessionId)) {
			throw new NotUpdateException("타인의 예약을 수정하지 말아주세요.");
		}
		dto.setCheckReserv(isReservOk);
		service.checkReserv(dto);
		return "seller/reservation/check-reserv";
	}
	
	//ajax로 reservationlistToUser받는 것
	@Auth(role= Role.USER)
	@RequestMapping("/users/getreservationlistToUser")
	@ResponseBody
	public List<ReservDto> getreservationlistToUser(HttpServletRequest request, HttpSession session, ReservDto dto, String pageNum) {
		List<ReservDto> list = service.reservationlistToUser(request, session, dto);
		
		//parameter로 넘어온 pageNum을 list에 담아 보낸다.
		if(list.size()!=0 && pageNum == null) {
			list.get(0).setPageNum(1);
		} else if(list != null && pageNum != null) {
			list.get(0).setPageNum(Integer.parseInt(pageNum));
		}
		
		return list;
	}
	
	@Auth(role = Role.USER)
	@RequestMapping("/users/reservationlist")
	public String reservationlistToUser(HttpServletRequest request, HttpSession session, ReservDto dto) {

		return "users/reservationlist";
	}
	
	@RequestMapping("/users/reservation/goPay")
	@ResponseBody
	public String goPay(ReservDto dto, String num, String isPaid, HttpSession session){
		dto.setReserv_num(Integer.parseInt(num));
		String sellerId = service.getSellerId(dto);
		String userId = service.getUserId(dto);
		String sessionId = (String)session.getAttribute("id");
		if(!sellerId.equals(sessionId)&&!userId.equals(sessionId)) {
			throw new NotUpdateException("타인의 예약을 수정하지 말아주세요.");
		}
		dto.setIsPaid(isPaid);
		service.updatePaid(dto);
		return "users/reservation/goPay";
	}
	
	@RequestMapping("/space/reservation/getTime")
	@ResponseBody
	public List<ReservDto> getReservTime(ReservDto dto){
		return service.getReservTime(dto);
	}
}
