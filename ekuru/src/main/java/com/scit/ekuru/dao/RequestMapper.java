package com.scit.ekuru.dao;

import java.util.ArrayList;

import com.scit.ekuru.vo.RequestCommentVO;
import com.scit.ekuru.vo.RequestVO;

public interface RequestMapper {

	//요청 게시글 넣기
	public int insertOne(RequestVO reqVO);
	
	//요청 게시글 1개 불러오기
	public RequestVO selectReqOne(int reqNum);
	
	//카테고리별 게시글 불러오기
	public ArrayList<RequestVO> requestCategoryResult(int categoryCode);
	
	//코멘트 달기
	public int insertComment(RequestCommentVO comment);
	
	//코멘트 불러오기
	public ArrayList<RequestCommentVO> selectComment(int reqNum);
}
