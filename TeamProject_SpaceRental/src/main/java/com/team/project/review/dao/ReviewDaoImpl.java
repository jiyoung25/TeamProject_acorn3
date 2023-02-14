package com.team.project.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.project.review.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	
	@Autowired private SqlSession session;

	@Override //Review 목록 가져오기
	public List<ReviewDto> getList(ReviewDto dto) {
		
		return session.selectList("review.getList", dto);
	}
	
	@Override //Review 목록 (사이드바) 가져오기
	public List<ReviewDto> getList2(int users_num) {
		
		return session.selectList("review.getList2", users_num);
	}
	
	@Override //id를 이용해 UsersNum 가져오기
	public int getUsersNum(String id) {
		return session.selectOne("review.getUsersNum", id);
	}
	
	@Override //Review의 갯수
	public int getCount(ReviewDto dto) {
		
		return session.selectOne("review.getCount", dto);
	}

	@Override //Review 추가
	public void insert(ReviewDto dto) {
		session.insert("review.insert", dto);
	}

	@Override //Review정보 얻어오기
	public ReviewDto getData(int num) {
		return session.selectOne("review.getData", num);
	}

	@Override //키워드를 활용한 Review 정보 얻어오기
	public ReviewDto getData(ReviewDto dto) {
		return session.selectOne("review.getData2", dto);
	}

	@Override //조회수 증가 시키기
	public void addReviewCount(int review_num) {
		session.update("review.addReviewCount", review_num);
	}

	@Override //Review 삭제
	public void delete(int review_num) {
		session.delete("review.delete", review_num);
	}

	@Override //Review 수정
	public void update(ReviewDto dto) {
		session.update("review.update",dto);
	}
}
