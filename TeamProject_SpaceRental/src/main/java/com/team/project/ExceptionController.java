package com.team.project;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.exception.NotExistRoomException;


@ControllerAdvice
public class ExceptionController {
	
	@ExceptionHandler(NotExistRoomException.class)
	public ModelAndView notExistRoom(NotExistRoomException nere){
		ModelAndView mView=new ModelAndView();
		mView.addObject("exception", nere);
		mView.addObject("info", "존재하지 않는 방 혹은 삭제된 방입니다.");
		mView.setViewName("error/notexistroom");
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
