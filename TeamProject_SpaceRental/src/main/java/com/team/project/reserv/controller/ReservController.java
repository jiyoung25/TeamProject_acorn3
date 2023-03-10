package com.team.project.reserv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.exception.NotUpdateException;
import com.team.project.interceptor.Auth;
import com.team.project.interceptor.Auth.Role;
import com.team.project.reserv.dto.ReservDto;
import com.team.project.reserv.service.ReservService;

@RestController
public class ReservController {
	@Autowired
	private ReservService service;
	
	@Auth(role = Role.USER)
	@PostMapping("/space/reservation")
	public ModelAndView reservation(HttpServletRequest request, @ModelAttribute ReservDto dto, HttpSession session, ModelAndView mView) {
		service.insert(dto, session);
		mView.setViewName("space/reservation");
		return mView;
	}
	
	@Auth(role = Role.SELLER)
	@GetMapping("/seller/reservation/reservationlist")
	public ModelAndView reservationlistToSeller(HttpServletRequest request, HttpSession session, @ModelAttribute ReservDto dto, ModelAndView mView) {
		
		service.reservationlistToSeller(request, mView, session, dto);
		mView.setViewName("seller/reservation/reservationlist");
		return mView;
	}
	
	@PutMapping("/seller/reservation/check-reserv")
	public void checkReserv(@RequestBody ReservDto dto, HttpSession session){
		String sellerId = service.getSellerId(dto);
		String id = (String)session.getAttribute("id");
		//if(!sellerId.equals(id)||유저 본인) {
		//	throw new NotUpdateException("타인의 예약을 수정하지 말아주세요.");
		//}
		service.checkReserv(dto);
	}
	
	//ajax로 reservationlistToUser받는 것
	@GetMapping("/hi/{id}")
	public List<ReservDto> getreservationlistToUser(HttpServletRequest request, HttpSession session, @ModelAttribute ReservDto dto, String pageNum, @PathVariable("id") String id) {
		List<ReservDto> list = service.reservationlistToUser(request, session, dto);
		//parameter로 넘어온 pageNum을 list에 담아 보낸다.
		if(list.size()!=0 && pageNum == null) {
			list.get(0).setPageNum(1);
		} else if(list != null && pageNum != null) {
			list.get(0).setPageNum(Integer.parseInt(pageNum));
		}
		System.out.println("hi");
		
		return list;
	}
	
	/*
	@GetMapping("/users/reservationlist")
	public ModelAndView reservationlistToUser(ModelAndView mView) {
		
		return mView;
	}
	*/
	
	@Auth(role = Role.USER)
	@PutMapping("/users/reservation/goPay")
	public void goPay(@RequestBody ReservDto dto, HttpSession session){
		String userId = service.getUserId(dto);
		String id = (String)session.getAttribute("id");
		if(!userId.equals(id)) {
			throw new NotUpdateException("타인의 예약을 수정하지 말아주세요.");
		}
		service.updatePaid(dto);
	}
	
	@GetMapping("/space/reservation/getTime")
	public List<ReservDto> getReservTime(@ModelAttribute ReservDto dto){
		return service.getReservTime(dto);
	}
}
