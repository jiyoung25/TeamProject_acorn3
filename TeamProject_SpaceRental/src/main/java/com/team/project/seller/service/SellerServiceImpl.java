package com.team.project.seller.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.seller.dao.SellerDao;
import com.team.project.seller.dto.SellerDto;

@Service
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	private SellerDao sellerDao;	

	@Override
	public void getList(ModelAndView mView) {		
		List<SellerDto> list=sellerDao.getList();
		mView.addObject("list", list);
	}

	@Override
	public void getData(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("space_num"));
		SellerDto dto=sellerDao.getData(num);
		request.setAttribute("dto", dto);
	}

	@Override

	public void insert(SellerDto dto, HttpServletRequest request) {
		sellerDao.insert(dto);
		System.out.println(dto.getUsers_num());
	}

	@Override
	public void delete(int space_num, HttpServletRequest request) {
		sellerDao.delete(space_num);
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
		//파일 크기
		long fileSize = image.getSize();
		
		// webapp/upload 폴더 까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/resources/upload");
		//db 에 저장할 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload = new File(filePath);
		if(!upload.exists()) {
			//만약 디렉토리가 존재하지X
			upload.mkdir();//폴더 생성
		}
		//저장할 파일의 이름을 구성한다. -> 우리가 직접 구성해줘야한다.
		String saveFileName = System.currentTimeMillis() + orgFileName;
		
		try {
			//upload 폴더에 파일을 저장한다.
			image.transferTo(new File(filePath + saveFileName));
			System.out.println();	//임시 출력
		}catch(Exception e) {
			e.printStackTrace();
		}

		String mainImagePath = "/resources/upload/" + saveFileName;
		
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
	public void getUsersNum(HttpServletRequest request, HttpSession session) {
		String id = (String)session.getAttribute("id");
		request.setAttribute("users_num", sellerDao.getUsersNum(id));
	}	

}
