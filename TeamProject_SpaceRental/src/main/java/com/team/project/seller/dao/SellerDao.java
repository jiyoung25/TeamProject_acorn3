package com.team.project.seller.dao;

import java.util.List;

import com.team.project.seller.dto.SellerDto;

public interface SellerDao {
	//공간 목록
	public List<SellerDto> getList(SellerDto dto);
	//공간 추가
	public void insert(SellerDto dto);
	//공간 정보 얻어오기
	public SellerDto getData(int space_num);
	//공간 수정
	public void update(SellerDto dto);
	//공간 삭제
	public void delete(int space_num);
}
