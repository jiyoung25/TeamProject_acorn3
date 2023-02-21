package com.team.project.space.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface SpaceService {
	public void getSpaceList(HttpServletRequest request);
	public void getDay(HttpServletRequest request);
	public void getSpaceData(HttpServletRequest request, int space_num);
	public ModelAndView getRecentReviewList(ModelAndView mView);
}
