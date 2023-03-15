package com.team.project.dib.dto;

import org.apache.ibatis.type.Alias;

@Alias("dibDto")
public class DibDto {
	private int dibson_num;
    private int users_num;
    private String users_id;
    private int space_num;
    
    //찜리스트를 뽑기 위한 dto
    private String space_name;
    private String mainImagePath;
    private String oneliner;
    private String addr;
    private int cate_num;
    private String cate_name;
    
    //페이지네이션
    private int startRowNum;
    private int endRowNum;
    
    public DibDto() {
    	
    }

	public DibDto(int dibson_num, int users_num, String users_id, int space_num, String space_name,
			String mainImagePath, String oneliner, String addr, int cate_num, String cate_name, int startRowNum,
			int endRowNum) {
		super();
		this.dibson_num = dibson_num;
		this.users_num = users_num;
		this.users_id = users_id;
		this.space_num = space_num;
		this.space_name = space_name;
		this.mainImagePath = mainImagePath;
		this.oneliner = oneliner;
		this.addr = addr;
		this.cate_num = cate_num;
		this.cate_name = cate_name;
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

	public String getSpace_name() {
		return space_name;
	}

	public void setSpace_name(String space_name) {
		this.space_name = space_name;
	}

	public String getMainImagePath() {
		return mainImagePath;
	}

	public void setMainImagePath(String mainImagePath) {
		this.mainImagePath = mainImagePath;
	}

	public String getOneliner() {
		return oneliner;
	}

	public void setOneliner(String oneliner) {
		this.oneliner = oneliner;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
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
