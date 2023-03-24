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
	public List<ReviewDto> getList2(ReviewDto dto) {
		
		return session.selectList("review.getList2", dto);
	}
	
	@Override
	public List<ReviewDto> getList3(ReviewDto dto) {
		
		return session.selectList("review.getList3", dto);
	}
	
	@Override
	public List<ReviewDto> adminReview(ReviewDto dto) {
		
		return session.selectList("review.adminReview", dto);
	}
	
	@Override //id를 이용해 UsersNum 가져오기
	public int getUsersNum(String id) {
		return session.selectOne("review.getUsersNum", id);
	}
	
	@Override //Review의 갯수
	public int getCount(ReviewDto dto) {
		
		return session.selectOne("review.getCount", dto);
	}
	
	@Override
	public int getCount2(ReviewDto dto) {
		
		return session.selectOne("review.getCount2", dto);
	}
	
	@Override //sellerId를 이용한 Review의 갯수
	public int getCount3(ReviewDto dto) {
		
		return session.selectOne("review.getCount3", dto);
	}
	
	@Override //모든 Review의 갯수
	public int adminCount(ReviewDto dto) {
		
		return session.selectOne("review.adminCount", dto);
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
	
	@Override
	public ReviewDto sellerReviewData(ReviewDto dto) {
		return session.selectOne("review.sellerReviewData", dto);
	}
	
	@Override
	public ReviewDto usersReviewData(ReviewDto dto) {
		return session.selectOne("review.usersReviewData", dto);
	}

	@Override //조회수 증가 시키기
	public void addReviewCount(int review_num) {
		session.update("review.addReviewCount", review_num);
	}

	@Override //Review 삭제
	public void delete(int review_num) {
		session.delete("review.delete", review_num);
	}
	
	@Override
	public void delete2(int space_num) {
		session.delete("review.delete2", space_num);
	}

	@Override //Review 수정
	public void update(ReviewDto dto) {
		session.update("review.update",dto);
	}
	
	public List<Integer> getReservNum(ReviewDto dto) {
		System.out.println(dto.getReview_writer());
		System.out.println(dto.getSpace_num());
		return session.selectList("review.getReservNum", dto);
	}
	
	public List<ReviewDto> possibleReview(ReviewDto dto){
		return session.selectList("review.possibleReview", dto);
	}
	
}
