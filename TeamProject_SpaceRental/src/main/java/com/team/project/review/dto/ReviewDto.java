package com.team.project.review.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("reviewDto")
public class ReviewDto {
	private int review_num;
	private int users_num;
	private int space_num;
	private int cate_num;
	private String review_title;
	private String review_content;
	private String review_writer;
	private int viewcount;
	private String review_regdate;
	private int reserv_num;
	private List<Integer> reservNumList;
	private String space_name;
	private int star;
	private String sellerId;
	
	private int startRowNum;
	private int endRowNum;
	private int prevNum; //이전글의 글번호
	private int nextNum; //다음글의 글번호
	
	public ReviewDto() {}

	public ReviewDto(int review_num, int users_num, int space_num, int cate_num, String review_title,
			String review_content, String review_writer, int viewcount, String review_regdate, int reserv_num,
			List<Integer> reservNumList, String space_name, int star, String sellerId, int startRowNum, int endRowNum,
			int prevNum, int nextNum) {
		super();
		this.review_num = review_num;
		this.users_num = users_num;
		this.space_num = space_num;
		this.cate_num = cate_num;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_writer = review_writer;
		this.viewcount = viewcount;
		this.review_regdate = review_regdate;
		this.reserv_num = reserv_num;
		this.reservNumList = reservNumList;
		this.space_name = space_name;
		this.star = star;
		this.sellerId = sellerId;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
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

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public String getReview_regdate() {
		return review_regdate;
	}

	public void setReview_regdate(String review_regdate) {
		this.review_regdate = review_regdate;
	}

	public int getReserv_num() {
		return reserv_num;
	}

	public void setReserv_num(int reserv_num) {
		this.reserv_num = reserv_num;
	}

	public List<Integer> getReservNumList() {
		return reservNumList;
	}

	public void setReservNumList(List<Integer> reservNumList) {
		this.reservNumList = reservNumList;
	}

	public String getSpace_name() {
		return space_name;
	}

	public void setSpace_name(String space_name) {
		this.space_name = space_name;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

}

