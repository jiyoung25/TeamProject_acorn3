package com.team.project.seller.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.team.project.seller.dto.SellerDto;

public interface SellerService {
	public void getList(HttpServletRequest request);
    public void getData(HttpServletRequest request);
    public void saveSpace(SellerDto dto);
    public void updateSpace(SellerDto dto);
    public void deleteSpace(int space_num, HttpServletRequest request);
    public Map<String, Object> uploadAjaxImage(SellerDto dto, HttpServletRequest request);
}
