package com.team.project.reserv.dto;

import org.apache.ibatis.type.Alias;

@Alias("reservDto")
public class ReservDto {
	private int reserv_num; //예약 번호
	private String users_id;//구매자 아이디
	private int space_num; //-- 공간 글 번호
	private int seller_num;
	private String reserv_date; //예약 날짜
	private String reserv_time; //예약 시간
	private String reserv_comment; //예약시 판매자에게 남길 말 (요청사항)
	private int reserv_count; //예약하는 사람 수
	private String reserv_reg;
	private String checkReserv;
	private String isPaid;
	private int totalMoney;
	
	
	//pagenation을 위한 항목
	private int startRowNum;
	private int endRowNum;
	private int reservCateNum;
	private int totalRow;
	private int pageNum;
	
	//jsp페이지의 table구성을 위한 항목
	private int cate_num;
	private String space_name;
	private String mainImagePath;
	
	public ReservDto() {
		
	}
	
	public ReservDto(int reserv_num, String users_id, int space_num, int seller_num, String reserv_date,
			String reserv_time, String reserv_comment, int reserv_count, String reserv_reg, String checkReserv,
			String isPaid, int totalMoney, int startRowNum, int endRowNum, int reservCateNum, int totalRow, int pageNum,
			int cate_num, String space_name, String mainImagePath) {
		super();
		this.reserv_num = reserv_num;
		this.users_id = users_id;
		this.space_num = space_num;
		this.seller_num = seller_num;
		this.reserv_date = reserv_date;
		this.reserv_time = reserv_time;
		this.reserv_comment = reserv_comment;
		this.reserv_count = reserv_count;
		this.reserv_reg = reserv_reg;
		this.checkReserv = checkReserv;
		this.isPaid = isPaid;
		this.totalMoney = totalMoney;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.reservCateNum = reservCateNum;
		this.totalRow = totalRow;
		this.pageNum = pageNum;
		this.cate_num = cate_num;
		this.space_name = space_name;
		this.mainImagePath = mainImagePath;
	}

	public int getReserv_num() {
		return reserv_num;
	}

	public void setReserv_num(int reserv_num) {
		this.reserv_num = reserv_num;
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

	public String getReserv_date() {
		return reserv_date;
	}

	public void setReserv_date(String reserv_date) {
		this.reserv_date = reserv_date;
	}

	public String getReserv_time() {
		return reserv_time;
	}

	public void setReserv_time(String reserv_time) {
		this.reserv_time = reserv_time;
	}

	public String getReserv_comment() {
		return reserv_comment;
	}

	public void setReserv_comment(String reserv_comment) {
		this.reserv_comment = reserv_comment;
	}

	public int getReserv_count() {
		return reserv_count;
	}

	public void setReserv_count(int reserv_count) {
		this.reserv_count = reserv_count;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
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

	public int getSeller_num() {
		return seller_num;
	}

	public void setSeller_num(int seller_num) {
		this.seller_num = seller_num;
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public String getSpace_name() {
		return space_name;
	}

	public void setSpace_name(String space_name) {
		this.space_name = space_name;
	}

	public String getReserv_reg() {
		return reserv_reg;
	}

	public void setReserv_reg(String reserv_reg) {
		this.reserv_reg = reserv_reg;
	}

	public String getCheckReserv() {
		return checkReserv;
	}

	public void setCheckReserv(String checkReserv) {
		this.checkReserv = checkReserv;
	}

	public String getIsPaid() {
		return isPaid;
	}

	public void setIsPaid(String isPaid) {
		this.isPaid = isPaid;
	}

	public int getReserv_cate_num() {
		return reservCateNum;
	}

	public void setReserv_cate_num(int reserv_cate_num) {
		this.reservCateNum = reserv_cate_num;
	}

	public int getReservCateNum() {
		return reservCateNum;
	}

	public void setReservCateNum(int reservCateNum) {
		this.reservCateNum = reservCateNum;
	}

	public String getMainImagePath() {
		return mainImagePath;
	}

	public void setMainImagePath(String mainImagePath) {
		this.mainImagePath = mainImagePath;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
}
