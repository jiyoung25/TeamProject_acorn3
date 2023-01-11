package com.team.project.space.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.project.space.service.SpaceService;

@Controller
public class SpaceController {
	@Autowired
	private SpaceService service;
	
	@GetMapping("/space/list")
	public String spaceList(HttpServletRequest request, int cate_num) {
		service.getSpaceList(request, cate_num);
		request.setAttribute("cate_num", cate_num);
		
		return "space/list";
	}
	
	@GetMapping("/space/detail")
	public String detail(HttpServletRequest request) {
		
		try {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		// 현재 날짜 구하기
        Calendar cal = Calendar.getInstance();
        String resultDate = sdf.format(cal.getTime());
        String year = resultDate.substring(0, 4);
        String month = resultDate.substring(4, 6);
        String day = resultDate.substring(6, 8);
        String today = year+"-"+month+"-"+day;
        System.out.println(today);
        
        //내일 날짜 구하기(최소 예약 날짜를 정하기 위해)
        Calendar cal2 = Calendar.getInstance();
        Date date = sdf.parse(resultDate);
        cal2.setTime(date);
        cal2.add(Calendar.DATE, 1);
        String resultDate2 = sdf.format(cal2.getTime());
        String year2 = resultDate2.substring(0, 4);
        String month2 = resultDate2.substring(4, 6);
        String day2 = resultDate2.substring(6, 8);
        String minday = year2+"-"+month2+"-"+day2;
        System.out.println(minday);
        
        //2달 뒤 날짜 구하기(최대 예약 날짜를 정하기 위해)
        Calendar cal3 = Calendar.getInstance();
        cal3.setTime(date);
        cal3.add(Calendar.MONTH, 2);
        String resultDate3 = sdf.format(cal3.getTime());
        String year3 = resultDate3.substring(0, 4);
        String month3 = resultDate3.substring(4, 6);
        String day3 = resultDate3.substring(6, 8);
        String maxday = year3+"-"+month3+"-"+day3;
        System.out.println(maxday);
        
        request.setAttribute("today", today);
        request.setAttribute("minday", minday);
        request.setAttribute("maxday", maxday);
        
		} catch(Exception e) {
			e.printStackTrace();
		}
        
		return("space/detail");
	}
}
