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
import com.scit.ekuru.service.UserService;
import com.scit.ekuru.vo.SuperPlanVO;
import com.scit.ekuru.vo.UserVO;

@Controller
@RequestMapping(value="/ad")
public class ADController {

	private static final Logger logger = LoggerFactory.getLogger(ADController.class);
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private RequestService service;
	
	@Autowired
	private UserService userService;
	
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

	//AD 계약서 작성 완료
	@RequestMapping(value="/superplan_doContract", method=RequestMethod.POST)
	public String splanContract(int adTotal) {
		String id = (String)session.getAttribute("userId");
		UserVO vo = userService.selectUserTest(id);
		int userPoint = vo.getUserPoint();
		
		//사용한 포인트 차감
		userPoint = userPoint-adTotal;
		String path = "";
		
		vo.setUserPoint(userPoint);
		path = userService.updatePoint(vo);
		
		return  path;
	}
	
	//AD 계약 완료창 열기
	@RequestMapping(value="/superplan_clear", method=RequestMethod.GET)
	public String splanClear() {
		logger.info("수퍼플랜 완료");
		
		return "ad/superplan_clear";
	}
	
}
