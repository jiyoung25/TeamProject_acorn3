package com.team.project.seller.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.seller.dto.SellerDto;

public interface SellerService {
	public void getList(ModelAndView mView, HttpServletRequest request);
    public SellerDto getData(HttpServletRequest request);
    public void getReviewList(ModelAndView mView, HttpServletRequest request);
    public void getQnaList(ModelAndView mView, HttpServletRequest request);
    public void insert(SellerDto dto, HttpServletRequest request);
    public void update(SellerDto dto, HttpServletRequest request);
    public void delete(HttpServletRequest request);
	public Map<String, Object> saveImage(HttpServletRequest request, MultipartFile image);
    public Map<String, Object> uploadAjaxImage(SellerDto dto, HttpServletRequest request);
    public int getUsersNum(HttpServletRequest request, HttpSession session);
    public List<SellerDto> getAddr(HttpServletRequest request, int cate_num);
}
