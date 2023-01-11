package com.team.project.category.dto;

import org.apache.ibatis.type.Alias;

@Alias("categoryDto")
public class CategoryDto {
	private int cate_num;
	private String cate_name;
	private int startRowNum;
	private int endRowNum;
	
	public CategoryDto() {
		
	}
	
	public CategoryDto(int cate_num, String cate_name, int startRowNum, int endRowNum) {
		super();
		this.cate_num = cate_num;
		this.cate_name = cate_name;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
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
}
