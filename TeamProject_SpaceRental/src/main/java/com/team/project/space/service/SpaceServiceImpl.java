package com.team.project.space.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.team.project.exception.NotExistRoomException;
import com.team.project.review.dto.ReviewDto;
import com.team.project.review.service.ReviewService;
import com.team.project.space.dao.SpaceDao;
import com.team.project.space.dto.SpaceDto;

@Service
public class SpaceServiceImpl implements SpaceService {
	@Autowired private SpaceDao dao;
	@Autowired private ReviewService reviewService;
	@Value("${file.location}")
	private String fileLocation;
	
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
		
		String[] searchArea =null;
		//키워드가 넘어왔다면
		if(search!="") {
			searchArea = search.split(",");
			for(int i=0; i<searchArea.length; i++) {
				searchArea[i] = "%" + searchArea[i] + "%";
			}
		}
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
			totalRow = dao.getCount(dto);
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

	@Transactional
	@Override
	public ModelAndView getSpaceData(ModelAndView mView, SpaceDto dto, HttpServletRequest request) {
		if(dao.getData(dto.getSpace_num()) == null) {
			throw new NotExistRoomException(request.getRequestURI());
		} else {
			mView.addObject("spaceDto", dao.getData(dto.getSpace_num()));
			mView.setViewName("/space/detail");
		}
		
		return mView;
	}

	@Override
	public ModelAndView getRecentReviewList(ModelAndView mView) {
		List<SpaceDto> recentReviewList =  dao.getRecentReviewList();
		for(int i=0; i<recentReviewList.size(); i++) {
			String reviewContent = recentReviewList.get(i).getReview_content();
			// 정규표현식 패턴을 작성합니다.
			Pattern pattern = Pattern.compile("<img.*?>");

			// 패턴에 매칭되는 부분을 제거합니다.
			java.util.regex.Matcher matcher = pattern.matcher(reviewContent);
			String result = matcher.replaceAll("");

			// 결과를 출력합니다. //이미지 태그를 뗀 content내용
			System.out.println(result);
		}
		return mView.addObject("recentReviewList", dao.getRecentReviewList());
	}
	
	@Override
	public String uploadImage(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws IOException {

		//Json 객체 생성
		JsonObject json = new JsonObject();
		// Json 객체를 출력하기 위해 PrintWriter 생성
		PrintWriter printWriter = null;
		OutputStream out = null;
		//파일을 가져오기 위해 MultipartHttpServletRequest 의 getFile 메서드 사용
		MultipartFile file = multiFile.getFile("upload");
		//파일이 비어있지 않고(비어 있다면 null 반환)
		if (file != null) {
			// 파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐때
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {

					try {
						//파일 이름 설정
						String fileName = file.getName();
						//바이트 타입설정
						byte[] bytes;
						//파일을 바이트 타입으로 변경
						bytes = file.getBytes();
						//파일이 실제로 저장되는 경로 
						String uploadPath = request.getServletContext().getRealPath("/resources/upload/");
						//저장되는 파일에 경로 설정
						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						//파일이름을 랜덤하게 생성
						fileName = UUID.randomUUID().toString();
						//업로드 경로 + 파일이름을 줘서  데이터를 서버에 전송
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						//클라이언트에 이벤트 추가
						printWriter = response.getWriter();
						response.setContentType("text/html");

						//파일이 연결되는 Url 주소 설정
						String fileUrl = request.getContextPath() + "/resources/upload/" + fileName;

						//생성된 jason 객체를 이용해 파일 업로드 + 이름 + 주소를 CkEditor에 전송
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.println(json);
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if(out !=null) {
							out.close();
						}
						if(printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
		return null;
	}
}
