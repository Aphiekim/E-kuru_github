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
	
	//메인 요청글 전체 불러오기
	public ArrayList<RequestVO> selectRequestAll(String search){
		ArrayList<RequestVO> requestList = null;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			requestList = mapper.selectRequestAll(search);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return requestList;
	}
	
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
	
	//내 요청글 수정
	public int updateRequest(RequestVO reqVO) {
		int cnt = 0;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			cnt = mapper.updateRequest(reqVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	//내 요청글 삭제
	public int deleteRequest(RequestVO request) {
		int cnt = 0;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			cnt = mapper.deleteRequest(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
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
	
	//코멘트 넣기
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
	
	//코멘트 불러오기
	public ArrayList<RequestCommentVO> selectComment(int reqNum){
		ArrayList<RequestCommentVO> commentList = null;

		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			commentList = mapper.selectComment(reqNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return commentList;
	}
	
	//코멘트 불러오기 전 글 넘버 가져오기
	public RequestCommentVO getReqNum(int requestCommentNum) {
		RequestCommentVO vo = null;
				
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			vo = mapper.getReqNum(requestCommentNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	//코멘트 지우기
	public int deleteComment(RequestCommentVO reqCommentVO) {
		int cnt = 0;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			cnt = mapper.deleteComment(reqCommentVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//내 요청 내역 불러오기
	public ArrayList<RequestVO> mypageReq(String id){
		ArrayList<RequestVO> list = null;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.mypageReq(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//내 요청글 내역 전체 삭제
	public int deleteMypageReq(String id) {
		int cnt = 0;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			cnt = mapper.deleteMypageReq(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
		
	}
	
	//AD관련 요청글 불러오기
	public ArrayList<RequestVO> selectReqAd(){
		ArrayList<RequestVO> list = null;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.selectReqAd();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	
}
