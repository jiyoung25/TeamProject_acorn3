package com.team.project.qna.dao;

import java.util.List;

import com.team.project.qna.dto.QnaDto;

public interface QnaDao {
	//Qna 목록
	public List<QnaDto> getList(QnaDto dto);
	//Qna 목록 (사이드바)
	public List<QnaDto> getList2(QnaDto dto);
	//아이디를 이용해 Qna 목록 가져오기
	public List<QnaDto> getList3(QnaDto dto);
	//Qna 목록
	public List<QnaDto> adminQna(QnaDto dto);
	//id를 이용해 UsersNum 가져오기
	public int getUsersNum(String id);
	//아디디 당 Qna의 갯수
	public int adminCount(QnaDto dto);
	//Qna의 갯수
	public int getCount2(QnaDto dto);
	//sellerId를 이용한 Qna의 갯수
	public int getCount3(QnaDto dto);
	//아디디 당 Qna의 갯수
	public int getCount(QnaDto dto);
	//Qna 추가
	public void insert(QnaDto dto);
	//Qna정보 얻어오기
	public QnaDto getData(int num);
	//seller가 올린 공간들의 Qna정보 얻어오기
	public QnaDto sellerQnaData(QnaDto dto);
	//user가 쓴 Qna정보 얻어오기
	public QnaDto usersQnaData(QnaDto dto);
	//키워드를 활용한 Qna 정보 얻어오기 (키워드에 부합하는 글 중에서 이전글, 다음글의 글번호도 얻어올수 있도록)
	public QnaDto getData(QnaDto dto);
	//조회수 증가 시키기
	public void addViewCount(int num);
	//Qna 삭제
	public void delete(int num);
	//space 삭제시 관련 qna 삭제
	public void delete2(int space_num);
	//Qna 수정
	public void update(QnaDto dto);
}
