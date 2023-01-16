package com.team.project.reserv.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.project.reserv.dao.ReservDao;
import com.team.project.reserv.dto.ReservDto;

@Service
public class ReservServiceImpl implements ReservService {
	@Autowired
	private ReservDao dao;

	@Override
	public void insert(ReservDto dto,HttpSession session) {
		dao.insert(dto);
	}

	@Override
	public List<ReservDto> reservationlist(HttpServletRequest request, HttpSession session) {
		
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
				
		//ReservDto 객체에 startRowNum 과 endRowNum 을 담는다.
		ReservDto dto=new ReservDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setUsers_id((String)session.getAttribute("id"));
				
		//글 목록 얻어오기
		// cate_num==0은 전체 목록에 대비한 것이다.
		// 전체 글의 개수도 함께 구한다.
		List<ReservDto> list = null;
		int totalRow=0;
		list = dao.getReservToSeller(dto);
		totalRow = dao.getCount((String)session.getAttribute("id"));
		System.out.println(list);
						
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
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("list", list);
		request.setAttribute("totalRow", totalRow);
		
		return dao.getReservToSeller(dto);
	}

	@Override
	public List<ReservDto> reservationOkList(ReservDto dto) {
		return null;
	}

	@Override
	public List<ReservDto> reservationFailList(ReservDto dto) {
		return null;
	}
	
	
}
