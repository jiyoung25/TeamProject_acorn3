package com.team.project.review.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.exception.InsertReviewException;
import com.team.project.review.dao.ReviewDao;
import com.team.project.review.dto.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired private ReviewDao reviewDao;

	@Override
	public void getList(HttpServletRequest request, int space_num) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;
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
		
		//ReviewDto 객체에 startRowNum, endRowNum 그리고  space_num을 담는다.
		ReviewDto dto=new ReviewDto();
		dto.setSpace_num(space_num);
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//리뷰 목록 얻어오기 
		List<ReviewDto> reviewlist = reviewDao.getList(dto);
		//전체글의 갯수
		int totalRow=reviewDao.getCount(dto);
		
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
		request.setAttribute("reviewlist", reviewlist);
		request.setAttribute("totalRow", totalRow);
	}
	
	@Override
	public void getList2(ModelAndView mView, HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;
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
		
		String id = (String)request.getSession().getAttribute("id");
		int num=reviewDao.getUsersNum(id);
		
		//ReviewDto 객체에 startRowNum, endRowNum, users_num을 담는다.
		ReviewDto dto=new ReviewDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setUsers_num(num);
		
		//리뷰 목록 얻어오기
		List<ReviewDto> reviewList=reviewDao.getList2(dto);
		//전체글의 갯수
		int totalRow=reviewDao.getCount2(dto);
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
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("totalRow", totalRow);
		
		mView.addObject("reviewList", reviewList);
		mView.addObject("possibleReview", this.possibleReview(dto, request));
	}
	
	@Override
	public void adminReview(ModelAndView mView, HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;
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
		
		String id = (String)request.getSession().getAttribute("id");
		int num=reviewDao.getUsersNum(id);
		
		//ReviewDto 객체에 startRowNum, endRowNum, users_num을 담는다.
		ReviewDto dto=new ReviewDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setUsers_num(num);
		
		//리뷰 목록 얻어오기
		List<ReviewDto> adminReview=reviewDao.adminReview(dto);
		//전체글의 갯수
		int totalRow=reviewDao.adminCount(dto);
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
		request.setAttribute("adminReview", adminReview);
		request.setAttribute("totalRow", totalRow);
		
		mView.addObject("adminReview", adminReview);
	}
	
	@Override
	public void getUsersNum(HttpServletRequest request, HttpSession session) {
		String id = (String)session.getAttribute("id");
		request.setAttribute("users_num", reviewDao.getUsersNum(id));
	}
	
	@Override
	public void getDetail(HttpServletRequest request, int space_num) {
		//자세히 보여줄 글번호를 읽어온다. 
		int num=Integer.parseInt(request.getParameter("review_num"));
		//조회수 올리기
		reviewDao.addReviewCount(num);
		//ReviewDto 객체를 생성해서 
		ReviewDto dto=new ReviewDto();
		//자세히 보여줄 글번호를 넣어준다. 
		dto.setReview_num(num);
		dto.setSpace_num(space_num);
		//글하나의 정보를 얻어온다.
		ReviewDto resultDto=reviewDao.getData(dto);
		
		//request scope 에 글 하나의 정보 담기
		request.setAttribute("dto", resultDto);
	}
	
	@Override
	public void sellerReviewDetail(HttpServletRequest request) {
		//자세히 보여줄 글번호를 읽어온다. 
		int num=Integer.parseInt(request.getParameter("review_num"));
		//자세히 보여줄 판매자의 id를 읽어온다
		String id = (String)request.getSession().getAttribute("id");
		//조회수 올리기
		reviewDao.addReviewCount(num);
		//ReviewDto 객체를 생성해서 
		ReviewDto dto=new ReviewDto();
		//자세히 보여줄 글번호를 넣어준다. 
		dto.setReview_num(num);
		dto.setSellerId(id);
		//글하나의 정보를 얻어온다.
		ReviewDto resultDto=reviewDao.sellerReviewData(dto);
		
		//request scope 에 글 하나의 정보 담기
		request.setAttribute("dto", resultDto);
	}
	
	@Override
	public void usersReviewDetail(HttpServletRequest request) {
		//자세히 보여줄 글번호를 읽어온다. 
		int num=Integer.parseInt(request.getParameter("review_num"));
		//자세히 보여줄 판매자의 id를 읽어온다
		String id = (String)request.getSession().getAttribute("id");
		int users_num=reviewDao.getUsersNum(id);
		//조회수 올리기
		reviewDao.addReviewCount(num);
		//ReviewDto 객체를 생성해서 
		ReviewDto dto=new ReviewDto();
		//자세히 보여줄 글번호를 넣어준다. 
		dto.setReview_num(num);
		dto.setUsers_num(users_num);
		//글하나의 정보를 얻어온다.
		ReviewDto resultDto=reviewDao.usersReviewData(dto);
		
		//request scope 에 글 하나의 정보 담기
		request.setAttribute("dto", resultDto);
	}

	@Override
	public void saveContent(ReviewDto dto, HttpServletRequest request) {
		request.setAttribute("cate_num", dto.getCate_num());
		request.setAttribute("space_num", dto.getSpace_num());
		
		reviewDao.insert(dto);
	}

	@Override
	public void updateContent(ReviewDto dto) {
		reviewDao.update(dto);
	}

	@Override
	public void deleteContent(int review_num, HttpServletRequest request) {
		reviewDao.delete(review_num);
	}

	@Override
	public void deleteContent2(HttpServletRequest request) {
		reviewDao.delete2((int)request.getAttribute("space_num"));
	}
	
	@Override
	public ReviewDto getData(HttpServletRequest request) {
		//수정할 글번호
		int num=Integer.parseInt(request.getParameter("review_num"));
		//수정할 글의 정보 얻어와서 
		ReviewDto dto=reviewDao.getData(num);
		//request 에 담아준다.
		request.setAttribute("dto", dto);
		
		return dto;
	}

	@Override
	public List<Integer> getReservNum(ReviewDto dto) {
		List<Integer> reservNumList = new ArrayList<Integer>();
		reservNumList = reviewDao.getReservNum(dto);
		return reservNumList;
	}

	@Override
	public List<ReviewDto> possibleReview(ReviewDto dto, HttpServletRequest request) {
		String review_writer = (String)request.getSession().getAttribute("id");

		//id를 dto에 입력한다.
		dto.setReview_writer(review_writer);
		
		//reservNumList를 dto에 입력한다.
		List<Integer> reservNumList = reviewDao.getReservNum(dto);
		dto.setReservNumList(reservNumList);
		
		request.setAttribute("possibleReview", reviewDao.possibleReview(dto));
		
		return reviewDao.possibleReview(dto);
	}

	@Transactional
	@Override
	public void goInsertForm(String info, HttpServletRequest request) {
		//select option으로 보낸 param -> [0]:reserv_num , [1]:space_num , [2]:cate_num
		String[] infoList = info.split("&&");
		
		request.setAttribute("reserv_num", infoList[0]);
		request.setAttribute("space_num", infoList[1]);
		request.setAttribute("cate_num", infoList[2]);
	}

}
