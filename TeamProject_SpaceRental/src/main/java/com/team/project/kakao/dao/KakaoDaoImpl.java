package com.team.project.kakao.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.project.kakao.dto.KakaoDto;

public class KakaoDaoImpl {
	@Autowired
	private SqlSession sql;
	
	// 정보 저장
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		sql.insert("users.kakaoInsert",userInfo);
	}

	// 정보 확인
	public KakaoDto findkakao(HashMap<String, Object> userInfo) {
		return sql.selectOne("users.findKakaoInfo", userInfo);
	}
}
