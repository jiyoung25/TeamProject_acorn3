package com.team.project.qna.dao;

import java.util.List;

import com.team.project.qna.dto.QnaDto;

public interface QnaDao {
	//글목록
	public List<QnaDto> getList(QnaDto dto);
	//글의 갯수
	public int getCount(QnaDto dto);
	//글 추가
	public void insert(QnaDto dto);
	//글정보 얻어오기
	public QnaDto getData(int num);
	//키워드를 활용한 글 정보 얻어오기 (키워드에 부합하는 글 중에서 이전글, 다음글의 글번호도 얻어올수 있도록)
	public QnaDto getData(QnaDto dto);
	//조회수 증가 시키기
	public void addViewCount(int num);
	//글 삭제
	public void delete(int num);
	//글 수정
	public void update(QnaDto dto);
}
