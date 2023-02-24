package com.team.project.dib.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.dib.dto.DibDto;

public interface DibService {
	public void dibInsert(DibDto dto, HttpSession session);
	public void dibDelete(int dibson_num);
	public void dibDelete(HttpServletRequest request);
	public void dibGetData(HttpServletRequest request, HttpSession session);
	public void dibGetDetailData(DibDto dto, HttpServletRequest request);
	public String getUserId(int num);
}
