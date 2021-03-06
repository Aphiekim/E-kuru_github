package com.scit.ekuru.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.ekuru.service.UserService;
import com.scit.ekuru.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService service;
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "user/joinForm";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO vo) {
		return service.insertUser(vo);
	}
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "user/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo) {
		System.out.println(vo);
		
		return service.loginUser(vo);
	}

	@RequestMapping(value = "/mypageMain", method = RequestMethod.GET)
	public String mypageMain() {
		return "user/mypage_main";
	}
	
	@RequestMapping(value = "/mypageInfo", method = RequestMethod.GET)
	public String mypageInfo() {
		return "user/mypage_info";
	}
	
	@RequestMapping(value = "/mypageShopping", method = RequestMethod.GET)
	public String mypageShopping() {
		return "user/mypage_shopping";
	}
	
	@RequestMapping(value = "/mypagePoint", method = RequestMethod.GET)
	public String mypagePoint() {
		return "user/mypage_point";
	}
}
