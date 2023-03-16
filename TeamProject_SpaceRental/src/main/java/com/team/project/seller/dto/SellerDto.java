package com.team.project.seller.dto;


import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("sellerDto")
public class SellerDto {
	private int space_num;
	private String space_name;
	private int users_num;
	private String oneliner;
	private String intro;
	private String mainImagePath;
	private String addr;
	private String addr2;
	private MultipartFile image;	//이미지 파일 업로드 처리를 위한 필드
	private String cate_name;
	private int cate_num;
	private int code;
	
	public SellerDto() {}

	public SellerDto(int space_num, String space_name, int users_num, String oneliner, String intro,
			String mainImagePath, String addr, String addr2, MultipartFile image, String cate_name, int cate_num, int code) {
		super();
		this.space_num = space_num;
		this.space_name = space_name;
		this.users_num = users_num;
		this.oneliner = oneliner;
		this.intro = intro;
		this.mainImagePath = mainImagePath;
		this.addr = addr;
		this.addr2 = addr2;
		this.image = image;
		this.cate_name = cate_name;
		this.cate_num = cate_num;
		this.code = code;
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

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

}
