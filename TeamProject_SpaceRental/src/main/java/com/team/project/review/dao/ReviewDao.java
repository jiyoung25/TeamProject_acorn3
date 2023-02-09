package com.team.project.review.dao;

import java.util.List;

import com.team.project.review.dto.ReviewDto;

public interface ReviewDao {
	//글목록
	public List<ReviewDto> getList(ReviewDto dto);
	//글의 갯수
	public int getCount(ReviewDto dto);
	//글 추가
	public void insert(ReviewDto dto);
	//글정보 얻어오기
	public ReviewDto getData(int num);
	//키워드를 활용한 글 정보 얻어오기 (키워드에 부합하는 글 중에서 이전글, 다음글의 글번호도 얻어올수 있도록)
	public ReviewDto getData(ReviewDto dto);
	//조회수 증가 시키기
	public void addReviewCount(int num);
	//글 삭제
	public void delete(int num);
	//글 수정
	public void update(ReviewDto dto);
}
