package com.scit.ekuru.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/request")
public class RequestViewController {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestViewController.class);
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
	
	//request 카테고리 결과로 이동
	@RequestMapping(value="/request_categoryResult", method=RequestMethod.GET)
	public String requestCategoryResult() {
		logger.info("Move to request category result");
		
		return "request/request_categoryResult";
	}
	
	//request 카테고리 결과로 이동
	@RequestMapping(value="/request_search", method=RequestMethod.GET)
	public String requestSearchResult() {
		logger.info("Move to request search result");
		
		return "request/request_search";
	}
}
