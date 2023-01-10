package com.team.project.seller.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.project.seller.dao.SellerDao;
import com.team.project.seller.dto.SellerDto;

@Service
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	private SellerDao sellerDao;	

	@Override
	public void getList(HttpServletRequest request) {
		SellerDto dto = new SellerDto();
		List<SellerDto> list=sellerDao.getList(dto);
	}

	@Override
	public void getInfo(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("space_num"));
		SellerDto dto=sellerDao.getData(num);
		request.setAttribute("dto", dto);
	}

	@Override
	public void saveSpace(SellerDto dto) {
		sellerDao.insert(dto);
	}

	@Override
	public void deleteSpace(int space_num, HttpServletRequest request) {
		sellerDao.delete(space_num);
	}

}
