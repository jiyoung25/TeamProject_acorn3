package com.team.project.seller.dto;

public class SellerDto {
	private int space_num;
	private String space_name;
	private String oneliner;
	private String intro;
	private String mainImagePath;
	private String addr;
	
	public SellerDto() {}

	public SellerDto(int space_num, String space_name, String oneliner, String intro, String mainImagePath,
			String addr) {
		super();
		this.space_num = space_num;
		this.space_name = space_name;
		this.oneliner = oneliner;
		this.intro = intro;
		this.mainImagePath = mainImagePath;
		this.addr = addr;
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
	
}
