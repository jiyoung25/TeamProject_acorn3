package com.team.project.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.project.seller.dto.SellerDto;
import com.team.project.seller.service.SellerService;

@Controller
public class SellerController {
	@Autowired
	private SellerService service;
	
	@RequestMapping("/seller/spacelist")
	public String list(HttpServletRequest request) {
		service.getList(request);
		return "seller/spacelist";
	}
	
	@RequestMapping("/seller/spaceinfo")
	public String spaceinfo() {
		return "seller/spaceinfo";
	}
	
	@RequestMapping("/seller/insert")
	public String insert(SellerDto dto, HttpSession session) {
		service.saveSpace(dto);
		return "seller/insert";
	}
	
	@RequestMapping("/seller/delete")
	public String delete(int space_num, HttpServletRequest request) {
		service.deleteSpace(space_num, request);
		return "redirect:/seller/spacelist"; //다시 한번 물어보는 것으로 수정예정
	}
	
}
