package com.scit.ekuru.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/ad")
public class ADController {

	private static final Logger logger = LoggerFactory.getLogger(ADController.class);
	
	//AD Splan 연결하기
	@RequestMapping(value="/superplan", method=RequestMethod.GET)
	public String adSuperPlan() {
		logger.info("수퍼플랜으로 이동하기");
		
		return "ad/superplan";
	}
	
	//AD 계약서로 연결하기
	@RequestMapping(value="/superplan_contract", method=RequestMethod.GET)
	public String adSuperPlanContract(int adTotal) {
		logger.info(adTotal + "수퍼플랜 계약서로 이동하기");
		
		return "ad/superplan_contract";
	}
	
}