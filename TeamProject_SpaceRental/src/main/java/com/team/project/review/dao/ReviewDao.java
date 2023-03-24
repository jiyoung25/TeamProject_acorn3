package com.team.project.review.dao;

import java.util.List;

import com.team.project.review.dto.ReviewDto;

public interface ReviewDao {
	//Review 목록 가져오기
	public List<ReviewDto> getList(ReviewDto dto);
	//Review 목록 (사이드바) 가져오기
	public List<ReviewDto> getList2(ReviewDto dto);
	//아이디를 이용해 Review 목록 가져오기
	public List<ReviewDto> getList3(ReviewDto dto);
	//admin Review
	public List<ReviewDto> adminReview(ReviewDto dto);
	//id를 이용해 UsersNum 가져오기
	public int getUsersNum(String id);
	//Review의 갯수
	public int getCount(ReviewDto dto);
	//users_num을 이용한 Review의 갯수
	public int getCount2(ReviewDto dto);
	//sellerId를 이용한 Review의 갯수
	public int getCount3(ReviewDto dto);
	//모든 Review의 갯수
	public int adminCount(ReviewDto dto);
	//Review 추가
	public void insert(ReviewDto dto);
	//Review정보 얻어오기
	public ReviewDto getData(int num);
	//키워드를 활용한 Review 정보 얻어오기
	public ReviewDto getData(ReviewDto dto);
	//seller가 오린 공간들의 review정도 얻어오기
	public ReviewDto sellerReviewData(ReviewDto dto);
	//user가 쓴 Qna정보 얻어오기
	public ReviewDto usersReviewData(ReviewDto dto);
	//조회수 증가 시키기
	public void addReviewCount(int num);
	//Review 삭제
	public void delete(int num);
	//해당 space_num의 Review 삭제
	public void delete2(int space_num);
	//Review 수정
	public void update(ReviewDto dto);
	//reserv_num 가져오기
	public List<Integer> getReservNum(ReviewDto dto);
	//review를 쓸 수 있는 목록 가져오기
	public List<ReviewDto> possibleReview(ReviewDto dto);
}
