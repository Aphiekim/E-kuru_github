package com.scit.ekuru.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.ekuru.service.RequestService;
import com.scit.ekuru.vo.SuperPlanVO;

@Controller
@RequestMapping(value="/ad")
public class ADController {

	private static final Logger logger = LoggerFactory.getLogger(ADController.class);
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private RequestService service;
	
	//AD Splan 연결하기
	@RequestMapping(value="/superplan", method=RequestMethod.GET)
	public String adSuperPlan() {
		logger.info("수퍼플랜으로 이동하기");
		
		return "ad/superplan";
	}
	
	//AD 계약서로 연결하기
	@RequestMapping(value="/superplan_contract", method=RequestMethod.GET)
	public String adSuperPlanContract(int adTotal, Model model) {
		logger.info(adTotal + "수퍼플랜 계약서로 이동하기");
		model.addAttribute("adTotal", adTotal);
		
		return "ad/superplan_contract";
	}
	
//	@RequestMapping(value="/applyReceipt", method=RequestMethod.GET)
//	public String applyReceipt(int adChCharge, int adProdCharge, int adReqCharge, Model model) {
//		logger.info("영수증에 가격 넣기");
//		model.addAttribute("adChCharge", adChCharge);
//		model.addAttribute("adProdCharge", adProdCharge);
//		model.addAttribute("adReqCharge", adReqCharge);
//		
//		return "ad/superplan_contract";
//		
//	}
	
}
