package com.team.project.seller.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.seller.dto.SellerDto;

@Repository
public class SellerDaoImpl implements SellerDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<SellerDto> getList(int users_num) {
		return session.selectList("seller.getList", users_num);
	}

	@Override
	public void insert(SellerDto dto) {
		session.insert("seller.insert", dto);
	}

	@Override
	public void update(SellerDto dto) {
		session.update("seller.update", dto);
		System.out.println(dto.getSpace_num());
	}

	@Override
	public void delete(int space_num) {
		session.delete("seller.delete", space_num);
	}

	@Override
	public SellerDto getData(int space_num) {
		return session.selectOne("seller.getData", space_num);
	}

	@Override
	public int getUsersNum(String id) {
		return session.selectOne("seller.getUsersNum", id);
	}

	@Override
	public List<SellerDto> getAddr(int cate_num) {
		return session.selectList("seller.getaddr", cate_num);
	}

	@Override
	public int addrCount(int cate_num) {
		return session.selectOne("seller.addrcount", cate_num);
	}

}
