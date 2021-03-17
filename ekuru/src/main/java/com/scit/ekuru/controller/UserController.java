package com.scit.ekuru.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Logger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.scit.ekuru.service.UserService;
import com.scit.ekuru.vo.ChannelVO;
import com.scit.ekuru.vo.ChatVO;
import com.scit.ekuru.vo.ProductVO;
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
		//System.out.println(vo);
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
		//System.out.println(vo);

		return service.loginUser(vo);
	}

	@RequestMapping(value = "/mypageMain", method = RequestMethod.GET)
	public String mypageMain(Model model) {
		HashMap<Object, Object> hash = service.selectUser((String) session.getAttribute("userId"));
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

		return "/user/mypage_info";
	}

	@RequestMapping(value = "/mypage_InfoForm", method = RequestMethod.GET)
	public String mypageInfoForm(Model model) {
		HashMap<Object, Object> hash = service.selectUser((String) session.getAttribute("userId"));
		model.addAttribute("state", hash.get("state"));
        model.addAttribute("addr1", hash.get("address1"));
        model.addAttribute("addr2", hash.get("address2"));
        model.addAttribute("user", hash.get("user"));
		return "/user/mypage_infoForm";
	}

	@RequestMapping(value = "/mypage_InfoForm", method = RequestMethod.POST)
	public String mypageInfoForm(UserVO vo) {
		//System.out.println(vo);
		return service.modifyUser(vo);
	}

	@RequestMapping(value = "/mypageShopping", method = RequestMethod.GET)
	public String mypageShopping(Model model) {
		ArrayList<HashMap<String, Object>> list = service.selectCart();
		model.addAttribute("cart", list);
		return "user/mypage_shopping";
	}

	@RequestMapping(value = "/chatForm", method = RequestMethod.GET)
	public String chatForm(Model model, ChatVO vo) {
		String id = (String)session.getAttribute("userId");
		UserVO uservo = service.selectUserTest(id);
		ChatVO chatvo = null;
		System.out.println(uservo);
		if(uservo.getUserType().equals("1")) {
			chatvo = service.selectChUser1();
		}else {
			chatvo = service.selectChUser2();
		}

		System.out.println(chatvo);

		ArrayList<HashMap<Object, Object>> chatroomlist = service.selectChatRoom(chatvo);
		model.addAttribute("chatroomlist", chatroomlist);

		//System.out.println(vo);

		ArrayList<HashMap<Object, Object>> chatlist = service.selectChat(vo);
		if(chatlist != null) {
			model.addAttribute("chatlist", chatlist);
			model.addAttribute("chatNum", chatlist.get(0).get("chatNum"));
		}


		return "/chat/chatForm";
	}

	@RequestMapping(value = "/chatForm", method = RequestMethod.POST)
	public String updateChat(ChatVO vo) {

		return service.updateChat(vo);
	}

	@RequestMapping(value = "/mypagePoint", method = RequestMethod.GET)
	public String mypagePoint(Model model) {
		String id = (String)session.getAttribute("userId");
		UserVO newVo = service.selectUserTest(id);

		ArrayList<HashMap<String, Object>> list = service.selectPoint();
		model.addAttribute("pointlist", list);
		session.setAttribute("userPoint", newVo.getUserPoint());

		return "user/mypage_point";
	}

	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public String email() throws Exception {

		// 메일 전송
		service.Mailcreate();
		return "redirect:/user/mypage_Info";
	}

	@RequestMapping(value="/mailConfirm", method=RequestMethod.GET)
	public String emailConfirm(@ModelAttribute("vo") UserVO vo, Model model) throws Exception {

		System.out.println(vo);
		UserVO user = service.selectUserTest(vo.getUserId());

		if(user.getAuthkey().equals(vo.getAuthkey())) {
			vo.setUserConfirm("1");
			//UserConfirm을 1로,, 권한 업데이트
			service.updateConfirm(vo);
		}


		return "redirect:/user/mypage_Info";
	}

	//포인트 화면으로 이동
	@RequestMapping(value="/mypage_pointPricing", method=RequestMethod.GET)
	public String pointPricing(Model model) {
		String id = (String)session.getAttribute("userId");

		UserVO user = service.selectUserTest(id);

		model.addAttribute("user", user);

		return "/user/mypage_pointPricing";
	}

	//결제 완료 페이지로 이동
	@RequestMapping(value="/mypage_paymentClear", method=RequestMethod.GET)
	public String payClear() {
		return "/user/mypage_paymentClear";
	}

	// 거래내역
	@RequestMapping(value = "/mypage_dealHistory", method=RequestMethod.GET)
	public String dealHistory(HttpSession session, Model model) {
		 service.dealHistory(session, model);
		return "user/mypage_dealHistory";
	}

	
	
	//최근 본 상품
	@RequestMapping(value="/viewedItems", method=RequestMethod.GET)
	public String viewedItems(Model model, HttpServletRequest request) {
		
		Cookie[] cook = request.getCookies();
		//전체 상품 정보를 저장하는 변수
		ArrayList<HashMap<Object, Object>> list = service.selectProdList();
		
		//최근 본 상품만 저장하기 위한 변수
		ArrayList<HashMap<Object, Object>> prodlist = new ArrayList<HashMap<Object,Object>>();
		
		// 해쉬로 저장하기 위해 필요한 변수
		HashMap<Object, Object> hash = new HashMap<Object, Object>();
		
		if(cook != null){
			for(int i = 0; i < cook.length; i++) {
				if(cook[i].getName().equals("prodnum")) {
					
					for(int j = 0; j < list.size(); j++) {
						String su = String.valueOf(list.get(j).get("PRODNUM"));
						if(cook[i].getValue().equals(su)) {
							hash.put("PRODNUM", list.get(j).get("PRODNUM"));
							hash.put("PRODINDATE", list.get(j).get("PRODINDATE"));
							hash.put("PRODTITLE", list.get(j).get("PRODTITLE"));
						}
					}
				}
			}
			
			
		}else{
			System.out.println("쿠키가 없어요");
		}
		
		
		prodlist.add(hash);
//		System.out.println(prodlist);
//		System.out.println(prodlist.size());
		if(prodlist.get(0).get("PRODNUM") != null) {
			model.addAttribute("prodlist", prodlist);
		}
		
		
		return "/user/mypage_browSingHistory";
	}
	
	//채팅방 채팅 생성
	@RequestMapping(value = "/createChat", method=RequestMethod.POST)
	public String createChat(ChatVO vo) {
		ChatVO chvo = service.selectChId(vo.getChId());
		vo.setChNum(chvo.getChNum());
		
		//System.out.println(chnum);
		return service.createChatRoom(vo);
	}
}
