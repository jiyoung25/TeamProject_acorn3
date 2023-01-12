package com.team.project.dib.dto;

import org.apache.ibatis.type.Alias;

@Alias("dibDto")
public class DibDto {
	private int dibson_num;
    private int users_num;
    private String users_id;
    private int space_num;
    private int startRowNum;
    private int endRowNum;
    
    public DibDto() {
    	
    }

	public DibDto(int dibson_num, int users_num, String users_id, int space_num, int startRowNum, int endRowNum) {
		super();
		this.dibson_num = dibson_num;
		this.users_num = users_num;
		this.users_id = users_id;
		this.space_num = space_num;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getDibson_num() {
		return dibson_num;
	}

	public void setDibson_num(int dibson_num) {
		this.dibson_num = dibson_num;
	}

	public int getUsers_num() {
		return users_num;
	}

	public void setUsers_num(int users_num) {
		this.users_num = users_num;
	}

	public String getUsers_id() {
		return users_id;
	}

	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}

	public int getSpace_num() {
		return space_num;
	}

	public void setSpace_num(int space_num) {
		this.space_num = space_num;
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
