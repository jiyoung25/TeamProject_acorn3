package com.team.project.dib.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.dib.dao.DibDao;
import com.team.project.dib.dto.DibDto;

@Service
public class DibServiceImpl implements DibService {
	@Autowired
	private DibDao dao;

	@Override
	public void dibInsert(DibDto dto) {
		dao.insert(dto);
	}

	@Override
	public void dibDelete(int dibson_num) {
		dao.delete(dibson_num);
	}

	@Override
	public void dibGetData(DibDto dto, HttpServletRequest request) {
		request.setAttribute("dibDto", dao.getData(dto));
	}

	@Override
	public void dibGetDetailData(DibDto dto, HttpServletRequest request) {
		request.setAttribute("dibDto", dao.getDetailData(dto));
	}
}
