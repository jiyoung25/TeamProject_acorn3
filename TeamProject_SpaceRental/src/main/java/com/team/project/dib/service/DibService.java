package com.team.project.dib.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.dib.dto.DibDto;

public interface DibService {
	public void dibInsert(DibDto dto);
	public void dibDelete(int dibson_num);
	public void dibGetData(DibDto dto, HttpServletRequest request);
	public void dibGetDetailData(DibDto dto, HttpServletRequest request);
	
}
