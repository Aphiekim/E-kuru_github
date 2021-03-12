package com.scit.ekuru.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.scit.ekuru.dao.RequestDAO;
import com.scit.ekuru.vo.RequestCommentVO;
import com.scit.ekuru.vo.RequestVO;

@Service
public class RequestService {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestService.class);
	
	@Autowired
	private RequestDAO dao;
	
	@Autowired
	private HttpSession session;
	
	//메인에 요청글 전체 출력
	public ArrayList<RequestVO> selectRequestAll(String search){
		return dao.selectRequestAll(search);
	}
	
	//요청 글쓰기
	public String insertOne(RequestVO reqVO) {
		//현재 로그인 되어있는 ID를 VO에 넣음
		String id = (String)session.getAttribute("userId");
		reqVO.setUserId(id);
		
		//현재 로그인 되어있는 ID를 VO에 넣음
//		RequestVO vo = null;
//		String id = (String)session.getAttribute("userId");
//		vo.setUserId(id);
//		vo.setCategoryCode(categoryCode);
//		vo.setReqTitle(reqTitle);
//		vo.setReqContent(reqContent);
//		//VO를 이용하여 글 저장
//		int cnt = dao.insertOne(vo);
//		logger.info("확인"+vo);
//		String path =" ";
		
		//VO를 이용하여 글 저장
		int cnt = dao.insertOne(reqVO);
		logger.info("확인"+reqVO);
		String path =" ";
		
		if(cnt>0) {
			logger.info("글쓰기 성공");
			path ="redirect:/request/request_main";
		}else {
			logger.info("글쓰기 실패");
			path = "request/request_writeForm";
		}
		
		return path;
	}
	
	//요청 글 1개 불러오기
	public RequestVO selectReqOne(int reqNum) {
		return dao.selectReqOne(reqNum);
	};
	
	//내 요청글 수정하기
	public String updateRequest(RequestVO reqVO) {
		String userId = (String)session.getAttribute("userId");
		reqVO.setUserId(userId);
		reqVO.setReqNum(reqVO.getReqNum());
		
		int cnt = dao.updateRequest(reqVO);
		logger.info("확인"+reqVO);
		String path =" ";
		
		if(cnt>0) {
			logger.info("수정 성공");
			int reqNum = reqVO.getReqNum();
			path ="redirect:/request/request_readForm?reqNum="+reqNum;
		}else {
			logger.info("수정 실패");
			path = "request/request_rewriteForm";
		}
		
		return path;
	}
	//내 요청글 삭제
	public String deleteRequest(int reqNum) {
		String id = (String)session.getAttribute("userId");
		RequestVO request= new RequestVO();
		request.setUserId(id);
		request.setReqNum(reqNum);
		
		String path ="";
		
		
		int cnt = dao.deleteRequest(request);
		
		if(cnt>0) {
			logger.info("요청글 삭제 성공");
			path ="redirect:/request/request_main";
		}else {
			logger.info("요청글 삭제 실패");
			path = "redirect:/request/request_readForm?reqNum="+reqNum;
		}
		return path;
	}
	
	//카테고리별 요청 글 불러오기
	public ArrayList<RequestVO> requestCategoryResult(int categoryCode) {
		return dao.requestCategoryResult(categoryCode);
	}
	
	//코멘트 달기
	public String insertComment(RequestCommentVO comment, int reqNum) {
		//Id와 reqNum 코멘트 VO에 넣기
		String id = (String)session.getAttribute("userId");
		comment.setUserId(id);
		comment.setReqNum(reqNum);
		
		logger.info("확인"+comment);
		//다오 실행
		int cnt = dao.insertComment(comment);
		String path = " ";
		
		if(cnt>0) {
			logger.info("코멘트 달기 성공");
			path = "redirect:/request/request_readForm?reqNum="+comment.getReqNum();
		}else {
			logger.info("코멘트 실패");
			path = "redirect:/request/request_readForm?reqNum="+comment.getReqNum();
		}
		
		return path;
	}
	
	//코멘트 불러오기
	public ArrayList<RequestCommentVO> selectComment(int reqNum){
		return dao.selectComment(reqNum);
	}
	
	//코멘트 지우기
	public int deleteComment(int reqCommentNum) {
		
		String id = (String)session.getAttribute("userId");
		RequestCommentVO comment = new RequestCommentVO();
		
		comment.setUserId(id);
		comment.setReqCommentNum(reqCommentNum);

		return dao.deleteComment(comment);

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
