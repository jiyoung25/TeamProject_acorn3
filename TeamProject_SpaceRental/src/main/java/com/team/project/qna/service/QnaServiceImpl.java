package com.team.project.qna.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.exception.NotDeleteException;
import com.team.project.qna.dao.QnaCommentDao;
import com.team.project.qna.dao.QnaDao;
import com.team.project.qna.dto.QnaCommentDto;
import com.team.project.qna.dto.QnaDto;
import com.team.project.review.dto.ReviewDto;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired private QnaDao qnaDao;
	@Autowired private QnaCommentDao qnaCommentDao;
	
	@Override
	public void getQnaList(HttpServletRequest request, int space_num) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int qnaPageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum=request.getParameter("qnaPageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			qnaPageNum=Integer.parseInt(strPageNum);
		}
		
		//보여줄 페이지의 시작 ROWNUM
		int qnaStartRowNum=1+(qnaPageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int qnaEndRowNum=qnaPageNum*PAGE_ROW_COUNT;
		
		/*
			[ 검색 키워드에 관련된 처리 ]
			-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.		
		*/
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
			
		//QnaDto 객체에 startRowNum, endRowNum 그리고  space_num을 담는다.
		QnaDto dto=new QnaDto();
		dto.setSpace_num(space_num);
		dto.setQnaStartRowNum(qnaStartRowNum);
		dto.setQnaEndRowNum(qnaEndRowNum);

		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){
			//검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("title_content")){//제목 + 내용 검색인 경우
				//검색 키워드를 QnaDto 에 담아서 전달한다.
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")){ //제목 검색인 경우
				dto.setTitle(keyword);
			}else if(condition.equals("writer")){ //작성자 검색인 경우
				dto.setWriter(keyword);
			} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
		}
		//글 목록 얻어오기 
		List<QnaDto> list = qnaDao.getList(dto);
		//전체글의 갯수
		int qnatotalRow=qnaDao.getCount(dto);
		
		//하단 시작 페이지 번호 
		int qnaStartPageNum = 1 + ((qnaPageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int qnaEndPageNum=qnaStartPageNum+PAGE_DISPLAY_COUNT-1;
		

		//전체 페이지의 갯수
		int qnatotalPageCount=(int)Math.ceil(qnatotalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(qnaEndPageNum > qnatotalPageCount){
			qnaEndPageNum=qnatotalPageCount; //보정해 준다.
		}
		//view page 에서 필요한 값을 request 에 담아준다. 
		request.setAttribute("qnaPageNum", qnaPageNum);
		request.setAttribute("qnaStartPageNum", qnaStartPageNum);
		request.setAttribute("qnaEndPageNum", qnaEndPageNum);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		request.setAttribute("qnatotalPageCount", qnatotalPageCount);
		request.setAttribute("list", list);
		request.setAttribute("qnatotalRow", qnatotalRow);
		
	}
	
	@Override
	public void getList2(ModelAndView mView, HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int qnaPageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum=request.getParameter("qnaPageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			qnaPageNum=Integer.parseInt(strPageNum);
		}
		
		//보여줄 페이지의 시작 ROWNUM
		int qnaStartRowNum=1+(qnaPageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int qnaEndRowNum=qnaPageNum*PAGE_ROW_COUNT;
		
		String id = (String)request.getSession().getAttribute("id");
		int num=qnaDao.getUsersNum(id);
		
		//QnaDto 객체에 startRowNum, endRowNum, users_num을 담는다.
		QnaDto dto=new QnaDto();
		dto.setQnaStartRowNum(qnaStartRowNum);
		dto.setQnaEndRowNum(qnaEndRowNum);
		dto.setUsers_num(num);
		
		List<QnaDto> qnaList=qnaDao.getList2(dto);
		//전체글의 갯수
		int qnatotalRow=qnaDao.getCount2(dto);
		
		//하단 시작 페이지 번호 
		int qnaStartPageNum = 1 + ((qnaPageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int qnaEndPageNum=qnaStartPageNum+PAGE_DISPLAY_COUNT-1;
		

		//전체 페이지의 갯수
		int qnatotalPageCount=(int)Math.ceil(qnatotalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(qnaEndPageNum > qnatotalPageCount){
			qnaEndPageNum=qnatotalPageCount; //보정해 준다.
		}
		//view page 에서 필요한 값을 request 에 담아준다. 
		request.setAttribute("qnaPageNum", qnaPageNum);
		request.setAttribute("qnaStartPageNum", qnaStartPageNum);
		request.setAttribute("qnaEndPageNum", qnaEndPageNum);
		request.setAttribute("qnatotalPageCount", qnatotalPageCount);
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("qnatotalRow", qnatotalRow);
		mView.addObject("qnaList", qnaList);
	}
	
	@Override
	public void adminQna(ModelAndView mView, HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int qnaPageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum=request.getParameter("qnaPageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			qnaPageNum=Integer.parseInt(strPageNum);
		}
		
		//보여줄 페이지의 시작 ROWNUM
		int qnaStartRowNum=1+(qnaPageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int qnaEndRowNum=qnaPageNum*PAGE_ROW_COUNT;
		
		String id = (String)request.getSession().getAttribute("id");
		int num=qnaDao.getUsersNum(id);
		
		//QnaDto 객체에 startRowNum, endRowNum, users_num을 담는다.
		QnaDto dto=new QnaDto();
		dto.setQnaStartRowNum(qnaStartRowNum);
		dto.setQnaEndRowNum(qnaEndRowNum);
		dto.setUsers_num(num);
		
		List<QnaDto> adminQna=qnaDao.adminQna(dto);
		//전체글의 갯수
		int qnatotalRow=qnaDao.adminCount(dto);
		
		//하단 시작 페이지 번호 
		int qnaStartPageNum = 1 + ((qnaPageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int qnaEndPageNum=qnaStartPageNum+PAGE_DISPLAY_COUNT-1;
		

		//전체 페이지의 갯수
		int qnatotalPageCount=(int)Math.ceil(qnatotalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(qnaEndPageNum > qnatotalPageCount){
			qnaEndPageNum=qnatotalPageCount; //보정해 준다.
		}
		//view page 에서 필요한 값을 request 에 담아준다. 
		request.setAttribute("qnaPageNum", qnaPageNum);
		request.setAttribute("qnaStartPageNum", qnaStartPageNum);
		request.setAttribute("qnaEndPageNum", qnaEndPageNum);
		request.setAttribute("qnatotalPageCount", qnatotalPageCount);
		request.setAttribute("adminQna", adminQna);
		request.setAttribute("qnatotalRow", qnatotalRow);
		mView.addObject("adminQna", adminQna);
	}

	@Override
	public void getUsersNum(HttpServletRequest request, HttpSession session) {
		String id = (String)session.getAttribute("id");
		request.setAttribute("users_num", qnaDao.getUsersNum(id));
	}
	
	@Override
	public void getDetail(HttpServletRequest request, int space_num) {
		
		//자세히 보여줄 글번호를 읽어온다. 
		int num=Integer.parseInt(request.getParameter("num"));
		//조회수 올리기
		qnaDao.addViewCount(num);
		
		/*
			[ 검색 키워드에 관련된 처리 ]
			-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.		
		*/
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		//만일 키워드가 넘어오지 않는다면 
		if(keyword==null){
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
			keyword="";
			condition=""; 
		}
		//QnaDto 객체를 생성해서 
		QnaDto dto=new QnaDto();
		//자세히 보여줄 글번호를 넣어준다. 
		dto.setNum(num);
		dto.setSpace_num(space_num);
		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){
			//검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("title_content")){//제목 + 내용 검색인 경우
				//검색 키워드를 CafeDto 에 담아서 전달한다.
				dto.setTitle(keyword);
				dto.setContent(keyword);			
			}else if(condition.equals("title")){ //제목 검색인 경우
				dto.setTitle(keyword);	
			}else if(condition.equals("writer")){ //작성자 검색인 경우
				dto.setWriter(keyword);	
			} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
		}
		
		//글하나의 정보를 얻어온다.
		QnaDto resultDto=qnaDao.getData(dto);
		
		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(keyword);
		
		/*
		[ 댓글 페이징 처리에 관련된 로직 ]
		*/
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=10;
	
		//detail.jsp 페이지에서는 항상 1페이지의 댓글 내용만 출력한다. 
		int pageNum=1;
	
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
	
		//원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		QnaCommentDto commentDto=new QnaCommentDto();
		commentDto.setRef_group(num);
		//1페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서  
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
	
		//1페이지에 해당하는 댓글 목록만 select 되도록 한다. 
		List<QnaCommentDto> commentList=qnaCommentDao.getList(commentDto);
	
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=qnaCommentDao.getCount(num);
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//request scope 에 글 하나의 정보 담기
		request.setAttribute("dto", resultDto);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("commentList", commentList);
		request.setAttribute("totalPageCount", totalPageCount);
		
	}
	
	@Override
	public void sellerQnaDetail(HttpServletRequest request) {
		
		//자세히 보여줄 글번호를 읽어온다. 
		int num=Integer.parseInt(request.getParameter("num"));
		//자세히 보여줄 판매자의 id를 읽어온다.
		String id = (String)request.getSession().getAttribute("id");
		//조회수 올리기
		qnaDao.addViewCount(num);
		
		/*
			[ 검색 키워드에 관련된 처리 ]
			-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.		
		*/
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		//만일 키워드가 넘어오지 않는다면 
		if(keyword==null){
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
			keyword="";
			condition=""; 
		}
		//QnaDto 객체를 생성해서 
		QnaDto dto=new QnaDto();
		//자세히 보여줄 글번호를 넣어준다. 
		dto.setNum(num);
		dto.setSellerId(id);
		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){
			//검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("title_content")){//제목 + 내용 검색인 경우
				//검색 키워드를 CafeDto 에 담아서 전달한다.
				dto.setTitle(keyword);
				dto.setContent(keyword);			
			}else if(condition.equals("title")){ //제목 검색인 경우
				dto.setTitle(keyword);	
			}else if(condition.equals("writer")){ //작성자 검색인 경우
				dto.setWriter(keyword);	
			} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
		}
		
		//글하나의 정보를 얻어온다.
		QnaDto resultDto=qnaDao.sellerQnaData(dto);
		
		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(keyword);
		
		/*
		[ 댓글 페이징 처리에 관련된 로직 ]
		*/
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=10;
	
		//detail.jsp 페이지에서는 항상 1페이지의 댓글 내용만 출력한다. 
		int pageNum=1;
	
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
	
		//원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		QnaCommentDto commentDto=new QnaCommentDto();
		commentDto.setRef_group(num);
		//1페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서  
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
	
		//1페이지에 해당하는 댓글 목록만 select 되도록 한다. 
		List<QnaCommentDto> commentList=qnaCommentDao.getList(commentDto);
	
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=qnaCommentDao.getCount(num);
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//request scope 에 글 하나의 정보 담기
		request.setAttribute("dto", resultDto);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("commentList", commentList);
		request.setAttribute("totalPageCount", totalPageCount);
		
	}
	
	@Override
	public void usersQnaDetail(HttpServletRequest request) {
		
		//자세히 보여줄 글번호를 읽어온다. 
		int num=Integer.parseInt(request.getParameter("num"));
		//자세히 보여줄 판매자의 id를 읽어온다.
		String id = (String)request.getSession().getAttribute("id");
		int users_num=qnaDao.getUsersNum(id);
		//조회수 올리기
		qnaDao.addViewCount(num);
		
		/*
			[ 검색 키워드에 관련된 처리 ]
			-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.		
		*/
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		//만일 키워드가 넘어오지 않는다면 
		if(keyword==null){
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
			keyword="";
			condition=""; 
		}
		//QnaDto 객체를 생성해서 
		QnaDto dto=new QnaDto();
		//자세히 보여줄 글번호를 넣어준다. 
		dto.setNum(num);
		dto.setUsers_num(users_num);
		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){
			//검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("title_content")){//제목 + 내용 검색인 경우
				//검색 키워드를 CafeDto 에 담아서 전달한다.
				dto.setTitle(keyword);
				dto.setContent(keyword);			
			}else if(condition.equals("title")){ //제목 검색인 경우
				dto.setTitle(keyword);	
			}else if(condition.equals("writer")){ //작성자 검색인 경우
				dto.setWriter(keyword);	
			} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
		}
		
		//글하나의 정보를 얻어온다.
		QnaDto resultDto=qnaDao.usersQnaData(dto);
		
		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(keyword);
		
		/*
		[ 댓글 페이징 처리에 관련된 로직 ]
		*/
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=10;
	
		//detail.jsp 페이지에서는 항상 1페이지의 댓글 내용만 출력한다. 
		int pageNum=1;
	
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
	
		//원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		QnaCommentDto commentDto=new QnaCommentDto();
		commentDto.setRef_group(num);
		//1페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서  
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
	
		//1페이지에 해당하는 댓글 목록만 select 되도록 한다. 
		List<QnaCommentDto> commentList=qnaCommentDao.getList(commentDto);
	
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=qnaCommentDao.getCount(num);
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//request scope 에 글 하나의 정보 담기
		request.setAttribute("dto", resultDto);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("commentList", commentList);
		request.setAttribute("totalPageCount", totalPageCount);
		
	}
	
	@Override
	public void saveContent(QnaDto dto) {
		qnaDao.insert(dto);
	}

	@Override
	public void updateContent(QnaDto dto) {
		qnaDao.update(dto);
	}

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		qnaDao.delete(num);
	}
	
	@Override
	public void deleteContent2(HttpServletRequest request) {
		qnaDao.delete2((int)request.getAttribute("space_num"));
	}

	@Override
	public QnaDto getData(HttpServletRequest request) {
		//수정할 글번호
		int num=Integer.parseInt(request.getParameter("num"));
		//수정할 글의 정보 얻어와서 
		QnaDto dto=qnaDao.getData(num);
		//request 에 담아준다.
		request.setAttribute("dto", dto);
		
		return dto;
	}

	@Override
	public void saveComment(HttpServletRequest request) {
		
		//폼 전송되는 파라미터 추출 
		int ref_group=Integer.parseInt(request.getParameter("ref_group")); //원글의 글번호
		String target_id=request.getParameter("target_id"); //댓글 대상자의 아이디
		String content=request.getParameter("content"); //댓글의 내용 
		/*
		 *  원글의 댓글은 comment_group 번호가 전송이 안되고
		 *  댓글의 댓글은 comment_group 번호가 전송이 된다.
		 *  따라서 null 여부를 조사하면 원글의 댓글인지 댓글의 댓글인지 판단할수 있다. 
		 */
		String comment_group=request.getParameter("comment_group");

		//댓글 작성자는 session 영역에서 얻어내기
		String writer=(String)request.getSession().getAttribute("id");
		//댓글의 시퀀스 번호 미리 얻어내기
		int seq=qnaCommentDao.getSequence();
		//저장할 댓글의 정보를 dto 에 담기
		QnaCommentDto dto=new QnaCommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		//원글의 댓글인경우
		if(comment_group == null){
			//댓글의 글번호를 comment_group 번호로 사용한다.
			dto.setComment_group(seq);
		}else{
			//전송된 comment_group 번호를 숫자로 바꾸서 dto 에 넣어준다. 
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		//댓글 정보를 DB 에 저장하기
		qnaCommentDao.insert(dto);
	}

	@Override
	public void deleteComment(HttpServletRequest request) {
		
		int num=Integer.parseInt(request.getParameter("num"));
		//삭제할 댓글 정보를 읽어와서 
		QnaCommentDto dto=qnaCommentDao.getData(num);
		String id=(String)request.getSession().getAttribute("id");
		//글 작성자와 로그인된 아이디와 일치하지 않으면
		if(!dto.getWriter().equals(id)) {
			throw new NotDeleteException("남의 댓글 지우면 혼난당!");
		}
		
		qnaCommentDao.delete(num);
	}

	@Override
	public void updateComment(QnaCommentDto dto) {
		qnaCommentDao.update(dto);
	}

	@Override
	public void moreCommentList(HttpServletRequest request) {
		
		//로그인된 아이디
		String id=(String)request.getSession().getAttribute("id");
		//ajax 요청 파라미터로 넘어오는 댓글의 페이지 번호를 읽어낸다
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		//ajax 요청 파라미터로 넘어오는 원글의 글 번호를 읽어낸다
		int num=Integer.parseInt(request.getParameter("num"));
		/*
			[ 댓글 페이징 처리에 관련된 로직 ]
		*/
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=10;

		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;

		//원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		QnaCommentDto commentDto=new QnaCommentDto();
		commentDto.setRef_group(num);
		//1페이지에 해당하는 startRowNum 과 endRowNum 을 dto 에 담아서  
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);

		//pageNum에 해당하는 댓글 목록만 select 되도록 한다. 
		List<QnaCommentDto> commentList=qnaCommentDao.getList(commentDto);
		//원글의 글번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=qnaCommentDao.getCount(num);
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);

		//view page 에 필요한 값 request 에 담아주기
		request.setAttribute("commentList", commentList);
		request.setAttribute("num", num); //원글의 글번호
		request.setAttribute("pageNum", pageNum); //댓글의 페이지 번호
	}
}
