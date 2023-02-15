package com.team.project.space.service;

import javax.servlet.http.HttpServletRequest;

public interface SpaceService {
	public void getSpaceList(HttpServletRequest request);
	public void getDay(HttpServletRequest request);
	public void getSpaceData(HttpServletRequest request, int space_num);
}
