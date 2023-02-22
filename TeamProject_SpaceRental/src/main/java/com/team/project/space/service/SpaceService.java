package com.team.project.space.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.team.project.space.dto.SpaceDto;

public interface SpaceService {
	public void getSpaceList(HttpServletRequest request);
	public void getDay(HttpServletRequest request);
	public ModelAndView getSpaceData(ModelAndView mView, SpaceDto dto, HttpServletRequest request);
	public ModelAndView getRecentReviewList(ModelAndView mView);
}
