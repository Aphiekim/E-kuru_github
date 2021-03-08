package com.scit.ekuru.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "user/joinForm";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO vo) {
		System.out.println(vo);
		return service.insertUser(vo);
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		service.logout();
		return "redirect:/";
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
	
	@RequestMapping(value = "/mypage_Info", method = RequestMethod.GET)
	public String mypageInfo(Model model) {
		
		//model.addAttribute("list", list);
		//서비스에서 모델 저장 오류
		HashMap<Object, Object> hash = service.selectUser((String) session.getAttribute("userId"));
		model.addAttribute("state", hash.get("state"));
        model.addAttribute("addr1", hash.get("address1"));
        model.addAttribute("addr2", hash.get("address2"));
        model.addAttribute("user", hash.get("user"));
		return "user/mypage_info";
	}
	
	@RequestMapping(value = "/mypage_InfoForm", method = RequestMethod.GET)
	public String mypageInfoForm(Model model) {
		HashMap<Object, Object> hash = service.selectUser((String) session.getAttribute("userId"));
		model.addAttribute("state", hash.get("state"));
        model.addAttribute("addr1", hash.get("address1"));
        model.addAttribute("addr2", hash.get("address2"));
        model.addAttribute("user", hash.get("user"));
		return "user/mypage_infoForm";
	}
	
	@RequestMapping(value = "/mypage_InfoForm", method = RequestMethod.POST)
	public String mypageInfoForm(UserVO vo) {
		System.out.println(vo);
		return service.modifyUser(vo);
	}
	
	@RequestMapping(value = "/mypageShopping", method = RequestMethod.GET)
	public String mypageShopping(Model model) {
		ArrayList<HashMap<String, Object>> list = service.selectCart();
		model.addAttribute("cart", list);
		return "user/mypage_shopping";
	}
	
	@RequestMapping(value = "/mypagePoint", method = RequestMethod.GET)
	public String mypagePoint(Model model) {
		ArrayList<HashMap<String, Object>> list = service.selectPoint();
		model.addAttribute("pointlist", list);
		return "user/mypage_point";
	}
}
