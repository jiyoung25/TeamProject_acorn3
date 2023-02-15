package com.team.project.space.service;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.project.space.dao.SpaceDao;
import com.team.project.space.dto.SpaceDto;

@Service
public class SpaceServiceImpl implements SpaceService {
	@Autowired
	private SpaceDao dao;
	
	@Override
	//나중에 space Service가 생기면 그쪽으로 옮길 예정
	public void getSpaceList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=8;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
				
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum=request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
				
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//SpaceDto 객체에 startRowNum 과 endRowNum 을 담는다.
		SpaceDto dto=new SpaceDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<SpaceDto> list = null;
		int totalRow=0;
				
		
		//[ 검색 키워드에 관련된 처리 ]
		//-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.	
		String search=request.getParameter("search");
		
		//만일 키워드가 넘어오지 않는다면 
		if(search==null){
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
			search="";
		}
		
		//키워드가 넘어왔다면
		String[] searchArea = search.split(",");
		dto.setSearchArea(searchArea);
		
		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(search);
		
		//cate_num을 구해온다.
		int cate_num = Integer.parseInt((String)request.getParameter("cate_num"));
		dto.setCate_num(cate_num);
		
		//전체 카테고리 보기를 위한 준비
		if(cate_num == 0) {
			list=dao.getSpaceAllList(dto);
			totalRow = dao.getAllCount();
			
		} else {
			list = dao.getSpaceList(dto);
			totalRow = dao.getCount(cate_num);
		}
				
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
				

		//전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; //보정해 준다.
		}
		//view page 에서 필요한 값을 request 에 담아준다. 
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("searchArea", searchArea);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("list", list);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("cate_num", cate_num);
	}
	
	@Override
	public void getDay(HttpServletRequest request) {
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
	}

	@Override
	public void getSpaceData(HttpServletRequest request, int space_num) {
		request.setAttribute("spaceDto", dao.getData(space_num));
	}
}
