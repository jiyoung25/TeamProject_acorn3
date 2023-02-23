package com.team.project.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.exception.NotDeleteException;
import com.team.project.exception.NotUpdateException;
import com.team.project.review.dto.ReviewDto;
import com.team.project.review.service.ReviewService;
import com.team.project.users.service.UsersService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("review/reviewupdateform")
	public String updateForm(HttpServletRequest request) {
		ReviewDto dto = service.getData(request);
		String review_writer = dto.getReview_writer();
		String id = (String)request.getSession().getAttribute("id");
		if(!review_writer.equals(id)) {
			throw new NotUpdateException("타인의 리뷰를 수정하지 말아주세요.");
		}
		return "review/reviewupdateform";
	}
	
	@RequestMapping("/review/reviewupdate")
	public String update(ReviewDto dto) {
		service.updateContent(dto);
		return "review/reviewupdate";
	}
	
	@RequestMapping("/review/delete")
	public String delete(int review_num, HttpServletRequest request) {
		String review_writer = service.getData(request).getReview_writer();
		String id = (String)request.getSession().getAttribute("id");
		if(!review_writer.equals(id)) {
			throw new NotDeleteException("타인의 리뷰를 삭제하지 말아주세요.");
		}
		service.deleteContent(review_num, request);
		return "redirect:/review/reviewlist";
	}
	
	@RequestMapping("/users/reviewDelete")
	public String delete2(int review_num, HttpServletRequest request) {
		String review_writer = service.getData(request).getReview_writer();
		String id = (String)request.getSession().getAttribute("id");
		if(!review_writer.equals(id)) {
			throw new NotDeleteException("타인의 리뷰를 삭제하지 말아주세요.");
		}
		
		service.deleteContent(review_num, request);
		return "redirect:/users/reviewList";
	}
	
	@RequestMapping("/review/reviewdetail")
	public String reviewdetail(HttpServletRequest request) {
		service.getDetail(request);
		return "review/reviewdetail";
	}
	
	@RequestMapping("/review/reviewlist")
	public String reviewlist(HttpServletRequest request, int space_num) {
		service.getList(request, space_num);
		return "review/reviewlist";
	}			
	
	@RequestMapping("/users/reviewList")
	public ModelAndView reviewList(ModelAndView mView, HttpServletRequest request, HttpSession session, ReviewDto dto) {
		service.getUsersNum(request, session);
		service.getList2(mView, request);
		
		mView.setViewName("users/reviewList");
		return mView;
	}
	
	@RequestMapping("/review/reviewInsertform")
	public String reviewInsertform(HttpServletRequest request, @RequestParam("possibleReview")String info) {
		service.goInsertForm(info, request);
		
		return "review/reviewInsertform";
	}
	
	@RequestMapping("/review/reviewInsert")
	public String insert(HttpServletRequest request, ReviewDto dto, HttpSession session) {
		//글 작성자는 세션에서 얻어낸다.
		String writer=(String)session.getAttribute("id");
		//dto 는 글의 제목과 내용만 있으므로 글작성자는 직접 넣어준다.
	    dto.setReview_writer(writer);
	    usersService.getReviewUsersnum(session, dto);
		service.saveContent(dto, request);
		return "review/reviewInsert";
	}
}
