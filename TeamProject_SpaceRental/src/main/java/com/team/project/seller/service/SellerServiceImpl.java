package com.team.project.seller.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.team.project.qna.dao.QnaDao;
import com.team.project.qna.dto.QnaDto;
import com.team.project.review.dao.ReviewDao;
import com.team.project.review.dto.ReviewDto;
import com.team.project.seller.dao.SellerDao;
import com.team.project.seller.dto.SellerDto;

@Service
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	private SellerDao sellerDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private QnaDao qnaDao;
	@Value("${file.location}")
	private String fileLocation;
	
	@Override
	public void getList(ModelAndView mView, HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");		
		int num=sellerDao.getUsersNum(id);
		List<SellerDto> list=sellerDao.getList(num);
		mView.addObject("list", list);
	}
	
	@Override
	public void getReviewList(ModelAndView mView, HttpServletRequest request) {
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
		//ReviewDto 객체에 startRowNum, endRowNum, sellerId을 담는다.
		ReviewDto dto=new ReviewDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setSellerId(id);
		
		//리뷰 목록 얻어오기
		List<ReviewDto> getReviewList = reviewDao.getList3(dto);
		//전체글의 갯수
		int totalRow=reviewDao.getCount3(dto);
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
		request.setAttribute("getReviewList", getReviewList);
		request.setAttribute("totalRow", totalRow);
		
		mView.addObject("getReviewList", getReviewList);
	}
	
	@Override
	public void getQnaList(ModelAndView mView, HttpServletRequest request) {
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
		//ReviewDto 객체에 startRowNum, endRowNum을 담는다.
		QnaDto dto=new QnaDto();
		dto.setQnaStartRowNum(qnaStartRowNum);
		dto.setQnaEndRowNum(qnaEndRowNum);
		dto.setSellerId(id);
		
		//리뷰 목록 얻어오기
		List<QnaDto> getQnaList = qnaDao.getList3(dto);
		
		//전체글의 갯수
		int qnatotalRow=qnaDao.getCount3(dto);
		
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
		request.setAttribute("getQnaList", getQnaList);
		request.setAttribute("qnatotalRow", qnatotalRow);
		
		mView.addObject("getQnaList", getQnaList);
	}
	
	@Override
	public SellerDto getData(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("space_num"));
		SellerDto dto=sellerDao.getData(num);
		request.setAttribute("dto", dto);
		
		return dto;
	}

	@Override

	public void insert(SellerDto dto, HttpServletRequest request) {
		sellerDao.insert(dto);
		System.out.println(dto.getUsers_num());
	}

	@Override
	public void delete(HttpServletRequest request) {
		sellerDao.delete((int)request.getAttribute("space_num"));
	}

	@Override

	public void update(SellerDto dto, HttpServletRequest request) {
		sellerDao.update(dto);
	}
	
	//이미지 ajax upload
	public Map<String, Object> uploadAjaxImage(SellerDto dto, HttpServletRequest request){
		//업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값을 얻어오기
		MultipartFile image = dto.getImage();
		//원본 파일명 -> 저장할 파일 이름 만들기위해서 사용됨
		String orgFileName = image.getOriginalFilename();
		
		//이미지를 저장할 실제 경로
		String realPath=request.getServletContext().getRealPath("/resources/upload");
		//디렉토리를 만들 파일 객체 생성
		File upload = new File(realPath);
		if(!upload.exists()) {
			//만약 디렉토리가 존재하지X
			upload.mkdir();//폴더 생성
		}
		//저장할 파일의 이름을 구성한다. -> 우리가 직접 구성해줘야한다.
		String saveFileName = System.currentTimeMillis() + orgFileName;
		
		try {
			//파일을 저장할 전체 경로를 구성한다.  
			String savePath=realPath+File.separator+saveFileName;
			//임시폴더에 업로드된 파일을 원하는 파일을 저장할 경로에 전송한다.
			image.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}

		String mainImagePath = "/resources/upload/"+saveFileName;
		
		//ajax upload 를 위한 mainImagePath return
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mainImagePath", mainImagePath);
		
		return map;
	}

	public Map<String, Object> saveImage(HttpServletRequest request, MultipartFile image) {
		//업로드된 파일에 대한 정보를 MultipartFile 객체를 이용해서 얻어낼수 있다.	
		
		//원본 파일명
		String orgFileName=image.getOriginalFilename();
		//upload 폴더에 저장할 파일명을 직접구성한다.
		// 1234123424343xxx.jpg
		String saveFileName=System.currentTimeMillis()+orgFileName;
		
		//이미지를 저장할 실제 경로
		String realPath=request.getServletContext().getRealPath("/resources/upload");
		// upload 폴더가 존재하지 않을경우 만들기 위한 File 객체 생성
		File upload=new File(realPath);
		if(!upload.exists()) {//만일 존재 하지 않으면
			upload.mkdir(); //만들어준다.
		}
		try {
			//파일을 저장할 전체 경로를 구성한다.  
			String savePath=realPath+File.separator+saveFileName;
			//임시폴더에 업로드된 파일을 원하는 파일을 저장할 경로에 전송한다.
			image.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		// json 문자열을 출력하기 위한 Map 객체 생성하고 정보 담기 
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("mainImagePath", "/resources/upload/"+saveFileName);
		
		return map;
	}

	@Override
	public int getUsersNum(HttpServletRequest request, HttpSession session) {
		String id = (String)session.getAttribute("id");
		int users_num = sellerDao.getUsersNum(id);
		request.setAttribute("users_num", users_num);
		
		return users_num;
	}

	@Override
	public List<SellerDto> getAddr(HttpServletRequest request, int cate_num) {
		return sellerDao.getAddr(cate_num);
	}
}
