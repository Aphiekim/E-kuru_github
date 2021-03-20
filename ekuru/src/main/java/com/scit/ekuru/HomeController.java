package com.scit.ekuru;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.scit.ekuru.service.ChannelService;
import com.scit.ekuru.service.RequestService;
import com.scit.ekuru.service.UserService;
import com.scit.ekuru.vo.ChannelVO;
import com.scit.ekuru.vo.PointProductVO;
import com.scit.ekuru.vo.ProductVO;
import com.scit.ekuru.vo.RequestVO;
import com.scit.ekuru.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="/")
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private RequestService reqService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ChannelService chService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("Open E-kuru Home-page");

		return "home";
	}
	
	@RequestMapping(value="/main_afterSearchForm", method = RequestMethod.POST)
	public String afterSearch(@RequestParam(defaultValue="")String search, Model model) {
		logger.info("메인에서 검색결과 가져오기");
		logger.info("검색어 : {}", search);
		
		ArrayList<RequestVO> reqList = reqService.selectRequestAll(search);
		ArrayList<RequestVO> adReqList = reqService.selectReqAd();
		ArrayList<ProductVO> prodList = chService.selectProdAll(search);
		ArrayList<ChannelVO> adChList = chService.selectChAd();
		
		model.addAttribute("search", search);
		model.addAttribute("adReqList", adReqList);
		model.addAttribute("reqList", reqList);
		model.addAttribute("prodList", prodList);
		model.addAttribute("adChList", adChList);
		
		return "main_afterSearchForm";
	}
	
		

	
}
