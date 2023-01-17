package com.team.project.qna.controller;

import java.net.URLEncoder;
import java.util.HashMap;
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

import com.team.project.qna.dto.QnaCommentDto;
import com.team.project.qna.dto.QnaDto;
import com.team.project.qna.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@RequestMapping("qna/qnaupdateform")
	public String updateForm(HttpServletRequest request) {
		service.getData(request);
		return "qna/qnaupdateform";
	}
	
	@RequestMapping("/qna/qnaupdate")
	public String update(QnaDto dto) {
		service.updateContent(dto);
		return "qna/qnaupdate";
	}
	
	@RequestMapping("/qna/delete")
	public String delete(int num, HttpServletRequest request) {
		service.deleteContent(num, request);
		return "redirect:/qna/qnalist";
	}
	
	@RequestMapping("/qna/qnadetail")
	public String qnadetail(HttpServletRequest request) {
		service.getDetail(request);
		return "qna/qnadetail";
	}
	
	@RequestMapping("/qna/qnalist")
	public String qnalist(HttpServletRequest request) {
		service.getList(request);
		return "qna/qnalist";
	}
	
	@RequestMapping("/qna/qnaInsertform")
	public String qnaInsertform(HttpServletRequest request, int cate_num, int space_num) {
		request.setAttribute("cate_num", cate_num);
		request.setAttribute("space_num", space_num);
		
		return "qna/qnaInsertform";
	}
	
	@RequestMapping("/qna/qnaInsert")
	public String insert(HttpServletRequest request, QnaDto dto, HttpSession session, int cate_num, int space_num) {
		request.setAttribute("cate_num", cate_num);
		request.setAttribute("space_num", space_num);
		//글 작성자는 세션에서 얻어낸다.
		String writer=(String)session.getAttribute("id");
		//dto 는 글의 제목과 내용만 있으므로 글작성자는 직접 넣어준다.
		dto.setWriter(writer);
		service.saveContent(dto);
		return "qna/qnaInsert";
	}
	
	//새로운 댓글 저장 요청 처리
	@RequestMapping("/qna/comment_insert")
	public String commentInsert(HttpServletRequest request, int ref_group) {
		
		service.saveComment(request);
	
		return "redirect:/qna/qnadetail?num="+ref_group;
	}
	
	//댓글 더보기 요청 처리
	@RequestMapping("/qna/ajax_comment_list")
	public String commentList(HttpServletRequest request) {
		
		//테스트를 위해 시간 지연 시키기
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		service.moreCommentList(request);
		
		return "qna/ajax_comment_list";
	}
	//댓글 삭제 요청 처리
	@RequestMapping("/qna/comment_delete")
	@ResponseBody
	public Map<String, Object> commentDelete(HttpServletRequest request) {
		service.deleteComment(request);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}
	//댓글 수정 요청처리 (JSON 을 응답하도록 한다)
	@RequestMapping("/qna/comment_update")
	@ResponseBody
	public Map<String, Object> commentUpdate(QnaCommentDto dto, HttpServletRequest request){
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}
}
