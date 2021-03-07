package com.scit.ekuru.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.ekuru.vo.RequestCommentVO;
import com.scit.ekuru.vo.RequestVO;

@Repository
public class RequestDAO {

	@Autowired
	private SqlSession session;
	
	//요청글 쓰기 위한 DAO
	public int insertOne(RequestVO reqVO) {
		int cnt = 0;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			cnt = mapper.insertOne(reqVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
		
	}
	
	//요청글 하나 읽기 위한 DAO
	public RequestVO selectReqOne(int reqNum) {
		RequestVO vo = null;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			vo = mapper.selectReqOne(reqNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	//카테고리별 게시글 불러오기 위함
	public ArrayList<RequestVO> requestCategoryResult(int categoryCode) {
		ArrayList<RequestVO> list = null;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.requestCategoryResult(categoryCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int insertComment(RequestCommentVO comment) {
		int cnt = 0;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			cnt = mapper.insertComment(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
}
