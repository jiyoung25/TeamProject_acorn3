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
		System.out.println(dto.getUsers_id());
		return session.selectList("reserv.getReservToSeller", dto);
	}

	@Override
	public int getSellerCount(ReservDto dto) {
		return session.selectOne("reserv.getSellerCount", dto);
	}
	
	public void checkReserv(ReservDto dto) {
		session.update("reserv.checkReserv", dto);
	}

	@Override
	public List<ReservDto> getReservToUser(ReservDto dto) {
		return session.selectList("reserv.getReservToUser", dto);
	}

	@Override
	public int getUserReservCount(ReservDto dto) {
		return session.selectOne("reserv.getUserReservCount", dto);
	}

	@Override
	public void updatePaid(ReservDto dto) {
		session.update("reserv.updatePaid", dto);
	}

	@Override
	public List<ReservDto> getTime(ReservDto dto) {
		return session.selectList("reserv.getTime", dto);
	}

	@Override
	public String getUserId(ReservDto dto) {
		return session.selectOne("reserv.getUserId", dto);
	}

	@Override
	public String getSellerId(ReservDto dto) {
		return session.selectOne("reserv.getSellerId", dto);
	}

	@Override
	public void delete(int space_num) {
		session.delete("reserv.delete", space_num);
	}
	
	
}
