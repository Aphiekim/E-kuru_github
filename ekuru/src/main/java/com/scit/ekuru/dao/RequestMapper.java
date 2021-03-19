package com.scit.ekuru.dao;

import java.util.ArrayList;

import com.scit.ekuru.vo.RequestCommentVO;
import com.scit.ekuru.vo.RequestVO;

public interface RequestMapper {
	//메인에 전체 글 불러오기
	public ArrayList<RequestVO> selectRequestAll(String search);

	//요청 게시글 넣기
	public int insertOne(RequestVO reqVO);
	
	//요청 게시글 1개 불러오기
	public RequestVO selectReqOne(int reqNum);
	
	//내 요청글 수정
	public int updateRequest(RequestVO reqVO);
	
	//내 요청글 삭제
	public int deleteRequest(RequestVO request);
	
	//해당 ID가 작성한 요청글 전체 불러오기
	public ArrayList<RequestVO> mypageReq(String id);
	
	//해당 ID 요청글 전체삭제
	public int deleteMypageReq(String id);
	
	//카테고리별 게시글 불러오기
	public ArrayList<RequestVO> requestCategoryResult(int categoryCode);
	
	//코멘트 달기
	public int insertComment(RequestCommentVO comment);
	
	//코멘트 불러오기
	public ArrayList<RequestCommentVO> selectComment(int reqNum);
	
	//코멘트 지우기 전 해당글의 번호 불러오기
	public RequestCommentVO getReqNum(int requestCommentNum);
	
	//코멘트 지우기
	public int deleteComment(RequestCommentVO reqCommentVO);
	
	//AD 관련 요청글 출력
	public ArrayList<RequestVO> selectReqAd();
}
