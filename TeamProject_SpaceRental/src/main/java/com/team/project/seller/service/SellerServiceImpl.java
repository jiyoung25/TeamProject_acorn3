package com.team.project.seller.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.team.project.seller.dao.SellerDao;
import com.team.project.seller.dto.SellerDto;

@Service
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	private SellerDao sellerDao;	

	@Override
	public void getList(HttpServletRequest request) {
		SellerDto dto = new SellerDto();
		List<SellerDto> list=sellerDao.getList(dto);
	}

	@Override
	public void getData(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("space_num"));
		SellerDto dto=sellerDao.getData(num);
		request.setAttribute("dto", dto);
	}

	@Override
	public void saveSpace(SellerDto dto) {
		sellerDao.insert(dto);
	}

	@Override
	public void deleteSpace(int space_num, HttpServletRequest request) {
		sellerDao.delete(space_num);
	}

	@Override
	public void updateSpace(SellerDto dto) {
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

		String imagePath = "/resources/upload/" + saveFileName;
		
		//ajax upload 를 위한 imagePath return
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("imagePath", imagePath);
		
		return map;
	}

}
