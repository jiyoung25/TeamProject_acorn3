package com.team.project.review.service;

import javax.servlet.http.HttpServletRequest;

import com.team.project.review.dto.ReviewDto;
import com.team.project.users.dto.UsersDto;



public interface ReviewService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void saveContent(ReviewDto dto);
	public void updateContent(ReviewDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void getData(HttpServletRequest request); //글 수정하기 위해 정보 불러오는 기능
	
}
