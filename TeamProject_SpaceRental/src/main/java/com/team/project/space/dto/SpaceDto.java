package com.team.project.space.dto;

import org.apache.ibatis.type.Alias;

@Alias("spaceDto")
public class SpaceDto {
	private int space_num; //등록한 공간의 글 번호
	private String space_name;//등록한 공간의 이름
	private int users_num; // 판매자 번호
	private String oneliner; // 등록한 공간 한 줄 소개
	private String intro; //등록한 공간 상세 소개
	private String mainImagePath; // 대표이미지 경로
	private String addr; //공간 주소
	private String addr2; //공간 상세주소
	private String cate_name; //등록한 공간의 카테고리 이름
	
	//다른 table들과의 join을 위한 field
	private int cate_num;
	private String review_content;
	private int star;
	
	//페이지 넘버링을 위한 정보
	private int startRowNum;
	private int endRowNum;
	
	//검색을 위한 정보
	private String[] searchArea;
	
	//(예외처리)없는 방을 들어갔을 때 필요한 정보
	private String path;
	
	public SpaceDto() {}

	public SpaceDto(int space_num, String space_name, int users_num, String oneliner, String intro,
			String mainImagePath, String addr, String addr2, String cate_name, int cate_num, String review_content, int star,
			int startRowNum, int endRowNum, String[] searchArea, String path) {
		super();
		this.space_num = space_num;
		this.space_name = space_name;
		this.users_num = users_num;
		this.oneliner = oneliner;
		this.intro = intro;
		this.mainImagePath = mainImagePath;
		this.addr = addr;
		this.addr2 = addr2;
		this.cate_name = cate_name;
		this.cate_num = cate_num;
		this.review_content = review_content;
		this.star = star;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.searchArea = searchArea;
		this.path = path;
	}

	public int getSpace_num() {
		return space_num;
	}
	public void setSpace_num(int space_num) {
		this.space_num = space_num;
	}
	public String getSpace_name() {
		return space_name;
	}
	public void setSpace_name(String space_name) {
		this.space_name = space_name;
	}
	public int getUsers_num() {
		return users_num;
	}
	public void setUsers_num(int users_num) {
		this.users_num = users_num;
	}
	public String getOneliner() {
		return oneliner;
	}
	public void setOneliner(String oneliner) {
		this.oneliner = oneliner;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getMainImagePath() {
		return mainImagePath;
	}
	public void setMainImagePath(String mainImagePath) {
		this.mainImagePath = mainImagePath;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
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
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public String[] getSearchArea() {
		return searchArea;
	}

	public void setSearchArea(String[] searchArea) {
		this.searchArea = searchArea;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}
