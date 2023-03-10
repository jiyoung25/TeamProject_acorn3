package com.team.project;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.project.seller.service.SellerService;

@Controller
public class NavigatorController {
	@Autowired
	SellerService service;
	
	@RequestMapping("/navigator")
	public String navigator(HttpServletRequest request) {
		service.getAddr(request);
		return "navigator";
	}
}
