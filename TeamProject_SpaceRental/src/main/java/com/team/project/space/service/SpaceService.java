package com.team.project.space.service;

import javax.servlet.http.HttpServletRequest;

public interface SpaceService {
	public void getSpaceList(HttpServletRequest request, int cate_num);
	public void getDay(HttpServletRequest request);
}
