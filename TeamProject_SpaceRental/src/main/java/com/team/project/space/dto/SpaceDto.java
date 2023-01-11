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
	private String cate_name; //등록한 공간의 카테고리 이름
	private int cate_num;
	
	//페이지 넘버링을 위한 정보
	private int startRowNum;
	private int endRowNum;
	
	//검색을 위한 정보
	private String keyword;
	private String condition;
	private String spaceName;
	
	public SpaceDto() {
		
	}
	
	
	public SpaceDto(int space_num, String space_name, int users_num, String oneliner, String intro,
			String mainImagePath, String addr, String cate_name, int cate_num, int startRowNum, int endRowNum,
			String keyword, String condition, String writer, String spaceName) {
		super();
		this.space_num = space_num;
		this.space_name = space_name;
		this.users_num = users_num;
		this.oneliner = oneliner;
		this.intro = intro;
		this.mainImagePath = mainImagePath;
		this.addr = addr;
		this.cate_name = cate_name;
		this.cate_num = cate_num;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.keyword = keyword;
		this.condition = condition;
		this.spaceName = spaceName;
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getSpaceName() {
		return spaceName;
	}
	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}
}
