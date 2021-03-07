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
import org.springframework.web.context.annotation.SessionScope;

import com.scit.ekuru.service.RequestService;
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
	public String requestMain() {
		logger.info("Move to request main");
		
		return "request/request_main";
	}
	
	//request 읽기폼으로 이동
	@RequestMapping(value="/request_readForm", method=RequestMethod.GET)
	public String requestReadForm() {
		logger.info("Move to request readForm");
		
		return "request/request_readForm";
	}
	
	//request 쓰기폼으로 이동
	@RequestMapping(value="/request_writeForm", method=RequestMethod.GET)
	public String requestWriteForm() {
		logger.info("Move to request writeForm");
		
		return "request/request_writeForm";
	}
	
	@RequestMapping(value="/request_write", method=RequestMethod.POST)
	public String requestWrite(RequestVO reqVO) {
		logger.info("Write your Request");
	
		return "redirect:/request_readForm";
	}
	
	//request 카테고리 결과로 이동
	@RequestMapping(value="/request_categoryResult", method=RequestMethod.GET)
	public String requestCategoryResult(int categoryCode, Model model) {
		logger.info("Move to request category result"+ categoryCode);
		ArrayList<RequestVO> list = null;
		list = service.requestCategoryResult(categoryCode);
		model.addAttribute("reqList", list);
		
		return "request/request_categoryResult";
	}
	
	//request 카테고리 결과로 이동
	@RequestMapping(value="/request_search", method=RequestMethod.GET)
	public String requestSearchResult() {
		logger.info("Move to request search result");
		
		return "request/request_search";
	}
}
