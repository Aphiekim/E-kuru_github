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

import com.scit.ekuru.service.ChannelService;
import com.scit.ekuru.service.RequestService;
import com.scit.ekuru.service.UserService;
import com.scit.ekuru.vo.PointUsedVO;
import com.scit.ekuru.vo.ProductVO;
import com.scit.ekuru.vo.RequestVO;
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

	@Autowired
	private ChannelService chService;
	
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
		String id = (String)session.getAttribute("userId");
		UserVO vo = userService.selectUserTest(id);
		ArrayList<RequestVO> reqList = service.mypageReq(id);
		ArrayList<ProductVO> prodList = chService.getProdList(id);
		
		model.addAttribute("adTotal", adTotal);
		model.addAttribute("reqList", reqList);
		model.addAttribute("prodList", prodList);
		model.addAttribute("vo", vo);
		
		return "ad/superplan_contract";
	}

	//AD 계약서 작성 완료
	@RequestMapping(value="/superplan_doContract", method=RequestMethod.POST)
	public String splanContract(SuperPlanVO splan) {
		
		logger.info("값 확인"+splan);
		
		String id = (String)session.getAttribute("userId");
		String path = "";
		
		UserVO vo = userService.selectUserTest(id);
		PointUsedVO point = new PointUsedVO();
		
		int userPoint = vo.getUserPoint();
		int adTotal = splan.getAdTotal();
		
		if(adTotal>userPoint || userPoint<0) {
			logger.info("포인트 결제 실패");
			path ="redirect:/ad/superplan_fail";
		}else {
			//사용한 포인트 차감
			userPoint = userPoint-adTotal;
			vo.setUserPoint(userPoint);
			session.setAttribute("userPoint", userPoint);
			
			//사용한 포인트 테이블에 추가
			point.setPointUsed(adTotal);
			point.setUserId(id);
			userService.insertUsedPoint(point);
			
			//신청한 수퍼플랜 내역 넣기
			splan.setUserId(id);
			if(splan.getAdReqCharge()>0 && splan.getAdProdCharge()==0) {
				userService.insertReqAd(splan);				
			}else if(splan.getAdProdCharge()>0 && splan.getReqNum()==0) {
				userService.insertChAd(splan);
			}
			
			path = userService.updatePoint(vo);
		}
		return  path;
	}
	
	//AD 계약 완료창 열기
	@RequestMapping(value="/superplan_clear", method=RequestMethod.GET)
	public String splanClear() {
		logger.info("수퍼플랜 완료");
		
		return "ad/superplan_clear";
	}
	
	//AD 계약 실패창 열기
	@RequestMapping(value="/superplan_fail", method=RequestMethod.GET)
	public String splanFail() {
		logger.info("수퍼플랜 포인트 결제 실패");
		
		return "ad/superplan_fail";
	}
}
