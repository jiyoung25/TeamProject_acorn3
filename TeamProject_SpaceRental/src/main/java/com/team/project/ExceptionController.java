package com.team.project;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.exception.NotDeleteException;
import com.team.project.exception.InsertReviewException;
import com.team.project.exception.NotExistRoomException;
import com.team.project.exception.NotUpdateException;


@ControllerAdvice
public class ExceptionController {
	
	@ExceptionHandler(NotDeleteException.class)
	public ModelAndView notDelete(NotDeleteException nde){
		ModelAndView mView=new ModelAndView();
		mView.addObject("exception", nde);
		mView.addObject("info", "본인의 글만 삭제할 수 있습니다.");
		mView.setViewName("error/notdelete");
		return mView;
	}
	
	@ExceptionHandler(NotUpdateException.class)
	public ModelAndView notUpdate(NotUpdateException nue){
		ModelAndView mView=new ModelAndView();
		mView.addObject("exception", nue);
		mView.addObject("info", "본인의 글만 수정할 수 있습니다.");
		mView.setViewName("error/notupdate");
		return mView;
	}
	
	@ExceptionHandler(NotExistRoomException.class)
	public ModelAndView notExistRoom(NotExistRoomException nere){
		ModelAndView mView=new ModelAndView();
		mView.addObject("exception", nere);
		mView.addObject("info", "존재하지 않는 방 혹은 삭제된 방입니다.");
		mView.setViewName("error/notexistroom");
		return mView;
	}
	
	@ExceptionHandler(InsertReviewException.class)
	public ModelAndView InsertReview(InsertReviewException ire){
		ModelAndView mView=new ModelAndView();
		mView.addObject("exception", ire);
		mView.addObject("info", "방을 예약하시고 이용 후 리뷰를 작성해주세요.");
		mView.setViewName("error/insertreview");
		return mView;
	}
	
	@ExceptionHandler(DataAccessException.class)
	public ModelAndView dataAccess(DataAccessException dae) {
		ModelAndView mView=new ModelAndView();
		mView.addObject("exception", dae);
		mView.setViewName("error/info");
		return mView;
	}
}
