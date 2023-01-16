package com.team.project.reserv.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.reserv.dto.ReservDto;

@Repository
public class ReservDaoImpl implements ReservDao {
	@Autowired
	private SqlSession session;

	@Override
	public void insert(ReservDto dto) {
		session.insert("reserv.insert", dto);
	}
	
	//셀러에게 넘어간 예약 파일(셀러는 예약확인을 해주어야 함)
	@Override
	public List<ReservDto> getReservToSeller(ReservDto dto) {
		return session.selectList("reserv.getReservToSeller", dto);
	}

	@Override
	public int getCount(String users_id) {
		return session.selectOne("reserv.getCount", users_id);
	}
	
	
}
