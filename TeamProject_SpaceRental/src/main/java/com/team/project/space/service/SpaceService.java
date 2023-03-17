package com.team.project.space.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.space.dto.SpaceDto;

public interface SpaceService {
	public void getSpaceList(HttpServletRequest request);
	public void getDay(HttpServletRequest request);
	public ModelAndView getSpaceData(ModelAndView mView, SpaceDto dto, HttpServletRequest request);
	public ModelAndView getRecentReviewList(ModelAndView mView);
    public String uploadImage(HttpServletRequest request, HttpServletResponse response,
	MultipartHttpServletRequest multiFile) throws IOException;
}
