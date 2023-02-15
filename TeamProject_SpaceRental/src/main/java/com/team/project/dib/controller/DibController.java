package com.team.project.dib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.project.dib.dto.DibDto;
import com.team.project.dib.service.DibService;
import com.team.project.interceptor.Auth;
import com.team.project.interceptor.Auth.Role;

@Controller
public class DibController {
	@Autowired
	private DibService service;
	
	@Auth(role = Role.USER)
	@RequestMapping("/space/dib_insert")
	public String insert(DibDto dto, int space_num, int users_num, String users_id) {
		service.dibInsert(dto);
		
		return "space/dib_insert";
	}
	
	@Auth(role = Role.USER)
	@RequestMapping("/space/dib_delete")
	public String delete(int dibson_num) {
		service.dibDelete(dibson_num);
		
		return "space/dib_delete";
	}
}
