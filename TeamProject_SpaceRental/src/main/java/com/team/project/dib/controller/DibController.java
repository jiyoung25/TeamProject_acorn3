package com.team.project.dib.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.project.dib.dto.DibDto;
import com.team.project.dib.service.DibService;
import com.team.project.exception.NotDeleteException;
import com.team.project.interceptor.Auth;
import com.team.project.interceptor.Auth.Role;

@Controller
public class DibController {
	@Autowired
	private DibService service;
	
	@Auth(role = Role.USER)
	@RequestMapping("/space/dib_insert")
	@ResponseBody
	public void insert(DibDto dto, HttpSession session) {
		service.dibInsert(dto, session);
	}
	
	@Auth(role = Role.USER)
	@RequestMapping("/space/dib_delete")
	@ResponseBody
	public void delete(int dibson_num, HttpSession session) {
		String dibOwner = service.getUserId(dibson_num);
		String id = (String)session.getAttribute("id");
		if(!dibOwner.equals(id)) {
			throw new NotDeleteException("타인의 찜을 삭제하지 말아주세요.");
		}
		service.dibDelete(dibson_num);
	}
	
	@Auth(role = Role.USER)
	@RequestMapping("/space/dib_list")
	@ResponseBody
	public void getDibList(DibDto dto, HttpServletRequest request) {
		service.dibGetDetailData(dto, request);
		//HttpServletRequest로 "dib_num"이라는 키에 해당하는 값이 넘어온다.
	}
}
