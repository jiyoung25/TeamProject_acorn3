package com.team.project.seller.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.project.seller.dto.SellerDto;
import com.team.project.seller.service.SellerService;

@Controller
public class SellerController {
	@Autowired
	private SellerService service;
	
	@RequestMapping("/seller/spacelist")
	public String list(HttpServletRequest request) {
		service.getList(request);
		return "seller/spacelist";
	}
	
	@RequestMapping("/seller/spaceinfo")
	public String spaceinfo() {
		return "seller/spaceinfo";
	}
	
	@RequestMapping("/seller/insert")
	public String insert(SellerDto dto, HttpServletRequest request) {
		service.insert(dto, request);
		return "seller/insert";
	}
	@RequestMapping("/seller/update")
	public String update(SellerDto dto, HttpServletRequest request) {
		service.update(dto, request);
		return "seller/update";
	}
	
	
	@RequestMapping("/seller/delete")
	public String delete(int space_num, HttpServletRequest request) {
		service.delete(space_num, request);
		return "redirect:/seller/spacelist"; //다시 한번 물어보는 것으로 수정예정
	}
	
	//사진 업로드 - ajax
	//json 으로 return 할 것
	@RequestMapping(value = "/seller/ajax_upload")
	@ResponseBody
	public Map<String, Object> ajaxUpload(SellerDto dto, HttpServletRequest request){		
		//form 에서 dto 로 데이터 받아옴
		//dto : MultipartFile image 를 가지고 있다.
		//request : imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		//return : { "imagePath" : "/upload/123456img_name.png" } 형식의 JSON 응답
		return service.uploadAjaxImage(dto, request);
	}
}
