package com.team.project.qna.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.qna.dto.QnaCommentDto;
import com.team.project.qna.dto.QnaDto;

public interface QnaService {
	public void getQnaList(HttpServletRequest request, int space_num);
	public void getList2(ModelAndView mView, HttpServletRequest request);
	public void adminQna(ModelAndView mView, HttpServletRequest request);
	public void getUsersNum(HttpServletRequest request, HttpSession session);
	public void getDetail(HttpServletRequest request, int space_num);
	public void sellerQnaDetail(HttpServletRequest request);
	public void usersQnaDetail(HttpServletRequest request);
	public void saveContent(QnaDto dto);
	public void updateContent(QnaDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void deleteContent2(HttpServletRequest request);
	public QnaDto getData(HttpServletRequest request);
	
	public void saveComment(HttpServletRequest request); //댓글 저장
	public void deleteComment(HttpServletRequest request); //댓글 삭제
	public void updateComment(QnaCommentDto dto); //댓글 수정
	public void moreCommentList(HttpServletRequest request); //댓글 더보기 기능
}
