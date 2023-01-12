package com.team.project.qna.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.project.qna.dto.QnaDto;
import com.team.project.qna.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@RequestMapping("/qna/qnalist")
	public String qnalist(HttpServletRequest request) {
		service.getList(request);
		return "qna/qnalist";
	}
	
	@RequestMapping("/qna/qnaInsertform")
	public String qnaInsertform() {
		
		return "qna/qnaInsertform";
	}
	
	@RequestMapping("/qna/qnaInsert")
	public String insert(QnaDto dto, HttpSession session) {
		//글 작성자는 세션에서 얻어낸다.
		String writer=(String)session.getAttribute("id");
		//dto 는 글의 제목과 내용만 있으므로 글작성자는 직접 넣어준다.
		dto.setWriter(writer);
		service.saveContent(dto);
		return "qna/qnaInsert";
	}
}
