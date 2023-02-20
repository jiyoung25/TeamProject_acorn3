package com.team.project.review.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.review.dto.ReviewDto;



public interface ReviewService {
	public void getList(HttpServletRequest request, int space_num);
	public void getList2(ModelAndView mView, HttpServletRequest request, ReviewDto dto);
	public void getUsersNum(HttpServletRequest request, HttpSession session);
	public void getDetail(HttpServletRequest request);
	public void saveContent(ReviewDto dto, HttpServletRequest request);
	public void updateContent(ReviewDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void getData(HttpServletRequest request); //글 수정하기 위해 정보 불러오는 기능
	public List<Integer> getReservNum(HttpSession session);
	public List<ReviewDto> possibleReview(ReviewDto dto, HttpSession session);
	public void goInsertForm(String info, HttpServletRequest request);
}
