package com.team.project.qna.dto;

import org.apache.ibatis.type.Alias;

@Alias("qnaDto")
public class QnaDto {
	private int num;
	private int users_num;
	private int space_num;
	private String title;
	private String content;
	private String writer;
	private int viewCount;
	private String regdate;
	private int qnaStartRowNum;
	private int qnaEndRowNum;
	private int qnaPrevNum; //이전글의 글번호
	private int qnaNextNum; //다음글의 글번호
	private String sellerId;
	private String space_name;
	
	public QnaDto() {}

	public QnaDto(int num, int users_num, int space_num, String title, String content, String writer, int viewCount,
			String regdate, int qnaStartRowNum, int qnaEndRowNum, int qnaPrevNum, int qnaNextNum, String sellerId,
			String space_name) {
		super();
		this.num = num;
		this.users_num = users_num;
		this.space_num = space_num;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.viewCount = viewCount;
		this.regdate = regdate;
		this.qnaStartRowNum = qnaStartRowNum;
		this.qnaEndRowNum = qnaEndRowNum;
		this.qnaPrevNum = qnaPrevNum;
		this.qnaNextNum = qnaNextNum;
		this.sellerId = sellerId;
		this.space_name = space_name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getUsers_num() {
		return users_num;
	}

	public void setUsers_num(int users_num) {
		this.users_num = users_num;
	}

	public int getSpace_num() {
		return space_num;
	}

	public void setSpace_num(int space_num) {
		this.space_num = space_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getQnaStartRowNum() {
		return qnaStartRowNum;
	}

	public void setQnaStartRowNum(int qnaStartRowNum) {
		this.qnaStartRowNum = qnaStartRowNum;
	}

	public int getQnaEndRowNum() {
		return qnaEndRowNum;
	}

	public void setQnaEndRowNum(int qnaEndRowNum) {
		this.qnaEndRowNum = qnaEndRowNum;
	}

	public int getQnaPrevNum() {
		return qnaPrevNum;
	}

	public void setQnaPrevNum(int qnaPrevNum) {
		this.qnaPrevNum = qnaPrevNum;
	}

	public int getQnaNextNum() {
		return qnaNextNum;
	}

	public void setQnaNextNum(int qnaNextNum) {
		this.qnaNextNum = qnaNextNum;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getSpace_name() {
		return space_name;
	}

	public void setSpace_name(String space_name) {
		this.space_name = space_name;
	}

}
