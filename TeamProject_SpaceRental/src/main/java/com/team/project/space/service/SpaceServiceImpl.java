package com.team.project.space.service;

import java.net.URLEncoder;
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
	public void getSpaceList(HttpServletRequest request, int cate_num) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=10;
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
				
		
		/*
		//[ 검색 키워드에 관련된 처리 ]
		//-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.		
		
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		//만일 키워드가 넘어오지 않는다면 
		if(keyword==null){
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
			keyword="";
			condition=""; 
		}
		
		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(keyword);
		
		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){
			//검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("spaceName")){ //제목 검색인 경우
				dto.setSpaceName(keyword);
			}// 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
		}
		*/
		
		//글 목록 얻어오기
		// cate_num==0은 전체 목록에 대비한 것이다.
		// 전체 글의 개수도 함께 구한다.
		List<SpaceDto> list = null;
		int totalRow=0;
		dto.setCate_num(cate_num);
		if(cate_num == 0) {
			list=dao.getSpaceAllList(dto);
			totalRow = dao.getAllCount();
			
		} else {
			list = dao.getSpaceList(dto);
			totalRow = dao.getCount(cate_num);
			System.out.println(list);
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
		//request.setAttribute("condition", condition);
		//request.setAttribute("keyword", keyword);
		//request.setAttribute("encodedK", encodedK);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("list", list);
		request.setAttribute("totalRow", totalRow);
	}
}
