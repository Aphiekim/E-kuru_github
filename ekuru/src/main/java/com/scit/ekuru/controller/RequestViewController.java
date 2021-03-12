package com.scit.ekuru.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import com.scit.ekuru.service.RequestService;
import com.scit.ekuru.vo.RequestCommentVO;
import com.scit.ekuru.vo.RequestVO;

@Controller
@RequestMapping(value="/request")
public class RequestViewController {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestViewController.class);
	
	@Autowired
	private RequestService service;
	
	@Autowired
	private HttpSession session;
	
	//request 메인화면으로 가기
	@RequestMapping(value="/request_main", method=RequestMethod.GET)
	public String requestMain(Model model, @RequestParam(defaultValue="")String search) {
		logger.info("Move to request main");
//		ArrayList<RequestVO> fashionList = service.requestCategoryResult(1);
//		ArrayList<RequestVO> beautyList = service.requestCategoryResult(2);
//		ArrayList<RequestVO> foodList = service.requestCategoryResult(3);
//		ArrayList<RequestVO> bookList = service.requestCategoryResult(4);
//		ArrayList<RequestVO> ectList = service.requestCategoryResult(5);
//		
//		model.addAttribute("fashionList", fashionList);
//		model.addAttribute("beautyList", beautyList);
//		model.addAttribute("foodList", foodList);
//		model.addAttribute("bookList", bookList);
//		model.addAttribute("ectList", ectList);
		
		ArrayList<RequestVO> requestList = service.selectRequestAll(search);
		model.addAttribute("requestList", requestList);
		return "request/request_main";
	}
	
	
	//request 쓰기폼으로 이동
	@RequestMapping(value="/request_writeForm", method=RequestMethod.GET)
	public String requestWriteForm() {
		logger.info("Move to request writeForm");
		return "request/request_writeForm";
	}
	
	//request 쓰기실행
	@RequestMapping(value="/request_write", method=RequestMethod.POST)
	public String requestWrite(RequestVO reqVO) {
		return service.insertOne(reqVO);
	}
	
	//rewrite 폼으로 이동
	@RequestMapping(value="/request_rewriteForm", method=RequestMethod.GET)
	public String requestRewirteForm(int reqNum, Model model) {
		//세션에서 로그인한 아이디 읽기
		String id = (String) session.getAttribute("userId");
		//전달된 글 번호로 수정할 글 읽기
		RequestVO vo = service.selectReqOne(reqNum);

		//본인 글이 아니면 메인화면으로 이동
		if(!id.equals(vo.getUserId())) {
			return "redirect:/request/request_readForm?reqNum="+reqNum;
		}
		
		model.addAttribute("vo", vo);
		return "request/request_rewriteForm";
	}

	//rewrite 업데이트 실행
	@RequestMapping(value="/request_update", method=RequestMethod.POST)
	public String updateRequest(RequestVO reqVO) {
		String path = service.updateRequest(reqVO);
		return path;
	}
	
	//request 읽기폼으로 이동
	@RequestMapping(value="/request_readForm", method=RequestMethod.GET)
	public String requestReadForm(int reqNum, Model model) {
		logger.info("Move to request readForm");
		//읽기 폼 내용 불러오기
		RequestVO vo = service.selectReqOne(reqNum);
		//코멘트 불러오기
		ArrayList<RequestCommentVO> comment = service.selectComment(reqNum);
		
		model.addAttribute("vo", vo);
		model.addAttribute("comment", comment);
		
		return "request/request_readForm";
	}
	
	// 내 요청글 지우기
	@RequestMapping(value="/request_deleteRequest")
	public String deleteRequest(int reqNum) {
		logger.info("{} 번 글 삭제하기", reqNum);
		
		return service.deleteRequest(reqNum);
	}
	
	//request 카테고리 결과로 이동
	@RequestMapping(value="/request_categoryResult", method=RequestMethod.GET)
	public String requestCategoryResult(int categoryCode, Model model) {
		logger.info("Move to request category result"+ categoryCode);
		ArrayList<RequestVO> list = service.requestCategoryResult(categoryCode);
		
		logger.info("확인"+list);
		model.addAttribute("reqList", list);
		
		return "request/request_categoryResult";
	}
	
	//request 카테고리 결과로 이동
	@RequestMapping(value="/request_search", method=RequestMethod.GET)
	public String requestSearchResult() {
		logger.info("Move to request search result");
		
		return "request/request_search";
	}
	
	//request에 댓글 달기
	@RequestMapping(value="/request_comment", method=RequestMethod.POST)
	public String requestComment(RequestCommentVO comment, int reqNum) {
		logger.info("코멘트 달기");
		comment.setReqCommentNum(reqNum);
		
		return service.insertComment(comment, reqNum);
	}
	
	//request 댓글 지우기
	@RequestMapping(value="/request_deleteComment", method=RequestMethod.GET)
	public String deleteComment(int reqCommentNum) {
		int cnt = service.deleteComment(reqCommentNum);
		String path =" ";
		
		if(cnt>0) {
			logger.info("코멘트 지우기 성공");
			path ="redirect:/request/request_main";
		}else {
			logger.info("코멘트 지우기 실패");
			path ="redirect:/request/request_main";
		}
		
		return path;
	}
	
	//검색결과
	@RequestMapping(value="/request_search", method = RequestMethod.POST)
	public String search(@RequestParam(defaultValue="")String search, Model model) {
		logger.info("검색어 : {}", search);
		logger.info("내용 검색 후, 목록 출력");
		
		ArrayList<RequestVO> searchList = service.selectRequestAll(search);
		model.addAttribute("searchList", searchList);
			
		return "request/request_search";
	}
	
	//내 요청글 history 가기
	@RequestMapping(value="/request_manageRequest", method=RequestMethod.GET)
	public String requestHistory(Model model) {
		logger.info("요청글 히스토리 열기");
		String id = (String)session.getAttribute("userId");
		ArrayList<RequestVO> list = service.mypageReq(id);
		
		model.addAttribute("list", list);
		return "/user/mypage_manageRequest";
	}
	
	@RequestMapping(value="/request_manageDelete", method=RequestMethod.GET)
	public String deleteHistory() {
		logger.info("요청글 히스토리 열기");
		String id = (String)session.getAttribute("userId");
		
		String path = service.deleteMypageReq(id);
		
		return path;
	}
	
}
