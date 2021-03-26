package com.scit.ekuru.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Logger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.scit.ekuru.service.ChannelService;
import com.scit.ekuru.service.UserService;
import com.scit.ekuru.vo.CartVO;
import com.scit.ekuru.vo.ChatVO;
import com.scit.ekuru.vo.PointUsedVO;
import com.scit.ekuru.vo.ProductVO;
import com.scit.ekuru.vo.UserVO;
import com.scit.ekuru.vo.dealHistoryVO;
import com.scit.ekuru.vo.specVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService service;

	@Autowired
	private ChannelService chService;


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
		//HashMap<Object, Object> hash = service.selectUser((String) session.getAttribute("userId"));
		HashMap<Object, Object> hash = service.selectUser((String) session.getAttribute("userId"));
		model.addAttribute("state", hash.get("state"));
        model.addAttribute("addr1", hash.get("address1"));
        model.addAttribute("addr2", hash.get("address2"));
        model.addAttribute("user", hash.get("user"));
		return "user/mypage_main";
	}

	@RequestMapping(value = "/mypage_Info", method = RequestMethod.GET)
	public String mypageInfo(Model model) {

		//model.addAttribute("list", list);
		//서비스에서 모델 저장 오류
		HashMap<Object, Object> hash = service.selectUser((String) session.getAttribute("userId"));

		// 채널 유무 확인
		String chId = (String) session.getAttribute("userId");
		String result = chService.chVerify(chId);
		System.out.println(result);
		model.addAttribute("state", hash.get("state"));
        model.addAttribute("addr1", hash.get("address1"));
        model.addAttribute("addr2", hash.get("address2"));
        model.addAttribute("user", hash.get("user"));
        model.addAttribute("result", result);

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
	public String mypageInfoForm(UserVO vo, HttpSession session, MultipartFile[] upload, HttpServletRequest request) {
		//System.out.println(vo);
		//파일이 업로드 될 경로 설정
		String saveDir = "C:\\Users\\MeoJong\\Desktop\\Project\\ekuru\\src\\main\\webapp\\resources\\upload\\file";
		//이렇게 하면 되는건가용?
				System.out.println(upload[0].getOriginalFilename());

				//위에서 설정한 경로의 폴더가 없을 경우 생성
				File dir = new File(saveDir);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				String reName = "person1.png";
				// 파일 업로드
				for(MultipartFile f : upload) {
					if(!f.isEmpty()) {
						// 기존 파일 이름을 받고 확장자 저장
						String orifileName = f.getOriginalFilename();
						String ext = orifileName.substring(orifileName.lastIndexOf("."));
						// 이름 값 변경을 위한 설정
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
						int rand = (int)(Math.random()*1000);

						// 파일 이름 변경
						reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;


						// 파일 저장
						try {
							f.transferTo(new File(saveDir + "/" + reName));
						}catch (IllegalStateException | IOException e) {
							e.printStackTrace();
							}
						}
					}
				vo.setUserProfile(reName);
				System.out.println(vo);
		return service.modifyUser(vo);
	}

	// 
	@RequestMapping(value = "/mypageShopping", method = RequestMethod.GET)
	public String mypageShopping(CartVO vo, Model model, HttpSession ssesion) {
		ArrayList<HashMap<String, Object>> list = service.selectCart();
		
		String id = (String) session.getAttribute("userId");
		
		UserVO user = service.selectUserTest(id);
		
		model.addAttribute("addr", user.getUserAddr());
		model.addAttribute("cart", list);
		return "user/mypage_shopping";
	}

	// 장바구니 삭제
	@RequestMapping(value = "/removeCart", method = RequestMethod.GET)
	public String removeCart(CartVO vo) {
		//ArrayList<HashMap<String, Object>> list = service.selectCart();
		System.out.println(vo);
		return service.deleteCart(vo.getCartProdNum());
	}

	// 채팅방 조회
	@RequestMapping(value = "/chatForm", method = RequestMethod.GET)
	public String chatForm(Model model, ChatVO vo) {
		String id = (String)session.getAttribute("userId");
		UserVO uservo = service.selectUserTest(id);
		ChatVO chatvo = null;
		System.out.println(uservo);
		
		if(uservo.getUserType().equals("0")) {
			chatvo = service.selectChUser1();
		}else {
			chatvo = service.selectChUser2();
		}

		System.out.println(chatvo);

		ArrayList<HashMap<Object, Object>> chatroomlist = service.selectChatRoom(chatvo);
		model.addAttribute("chatroomlist", chatroomlist);
		
		//System.out.println(vo);

		//ArrayList<HashMap<Object, Object>> chatlist = service.selectChat(vo);
		ArrayList<HashMap<Object, Object>> chatlist = service.selectChat(vo);
		//System.out.println("chat 리스트" + chatlist);



		ChatVO buyervo = service.selectBuyer(vo.getChatNum());

		if(chatlist != null) {
			model.addAttribute("chatlist", chatlist);
			model.addAttribute("chatNum", chatlist.get(0).get("chatNum"));
			model.addAttribute("buyerId", buyervo.getUserId());
			model.addAttribute("userType", uservo.getUserType());
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
		ArrayList<PointUsedVO> usedPoint = service.selectUsedPointList(id);

		ArrayList<HashMap<String, Object>> list = service.selectPoint();
		model.addAttribute("pointlist", list);
		model.addAttribute("usedPoint", usedPoint);
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
		HashMap<Object, Object> hash = null;


		//쿠키가 있는지 먼저 확인
		if(cook != null){

			//System.out.println("카운트 : " + "prodnum" + String.valueOf(0));
			//System.out.println("쿠키 length : " + cook.length);
			//int flag = 1;

			int count = 0;

			// db 저장된 전체 상품의 갯수만큼 반복
			while(count < list.size()) {

				// count번째 상품의 PRODNUM을 String으로 변환해서 su에 대입
				String su = String.valueOf(list.get(count).get("PRODNUM"));
				//System.out.println("while문 : " + su);

				//쿠키의 length만큼 반복
				for(int j = 0;j < cook.length; j++) {

					//System.out.println("for문 : " + cook[j].getValue());
					//System.out.println("for문 : " + su);

					// j번째 쿠키의 값과 su의 값이 같으면 if문 실행 (cook의 상품번호와 == su의 상품번호)
					// 맞다면 새로운 hash 객체를 생성해서 count번째의 상품정보를 hash에 저장후 prodlist로 add 그리고 for문 종료
					if(cook[j].getValue().equals(su)) {
						hash = new HashMap<Object, Object>();
						hash.put("PRODNUM", list.get(count).get("PRODNUM"));
						hash.put("PRODINDATE", list.get(count).get("PRODINDATE"));
						hash.put("PRODTITLE", list.get(count).get("PRODTITLE"));
						hash.put("PRODORIGINALPIC1", list.get(count).get("PRODORIGINALPIC1"));
						//flag++;
						prodlist.add(hash);
						//System.out.println(hash);
						break;
					}
				}
			//다음 상품으로
			count++;
			}
		}else{
			System.out.println("쿠키가 없어요");
		}

		//System.out.println(prodlist);

		if(prodlist.size() > 0) {
			model.addAttribute("prodlist", prodlist);
		}


		return "/user/mypage_browSingHistory";
	}


	// 쿠키 삭제
	@RequestMapping(value = "/removeCookie")
	public String removeCookie(HttpServletResponse response, HttpServletRequest request){
		ArrayList<HashMap<Object, Object>> list = service.selectProdList();
		Cookie[] cookies = request.getCookies();
		Cookie kc = null;

		int count = 0;
		while(count < list.size()) {
			for(int i = 0; i < cookies.length; i++) {
				String su = String.valueOf(list.get(count).get("PRODNUM"));
				if(cookies[i].getValue().equals(su)) {
					kc = new Cookie("prodnum" + su, null);
					response.addCookie(kc);
				}
			}
			count++;
		}

		return "redirect:/user/viewedItems";
	}

//	장바구니 저장
	@RequestMapping(value = "/addCart", method=RequestMethod.POST)
	public String addCart(CartVO vo, HttpSession session){
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);
		service.addCart(vo);
		System.out.println(vo);
		return "redirect:/user/mypageShopping";
	}



	//채팅방 채팅 생성
	@RequestMapping(value = "/createChat", method=RequestMethod.POST)
	public String createChat(ChatVO vo) {
		ChatVO chvo = service.selectChId(vo.getChId());
	      vo.setChNum(chvo.getChNum());

	      //System.out.println(chnum);
	      return service.createChatRoom(vo);
	}

	//명세작성 폼으로 이동
	@RequestMapping(value = "/writeStatement", method=RequestMethod.POST)
	public String writeStatement(specVO vo, Model model) {
		//System.out.println(vo);

		UserVO user = service.selectUserTest(vo.getUserId());
		
		ChatVO chat = service.selectChatRoomOne(vo.getChatNum());
		
		//System.out.println(chat);
		
		//System.out.println(user);
		model.addAttribute("pic", chat.getReqOriginalPic1());
		model.addAttribute("user", user);
		model.addAttribute("buyerId", vo.getUserId());
		model.addAttribute("chatNum", vo.getChatNum());
		return "/deal/deal_specificationForm";
	}

	//명세작성 폼으로 이동
	@RequestMapping(value = "/WriteSpec", method=RequestMethod.POST)
	public String writeSpec(specVO vo) {
		vo.setChNum(service.selectChId(vo.getChId()).getChNum());
		System.out.println("writeSpec VO : " + vo);
		service.insertSpec(vo);
		return "redirect:/user/chatForm";
	}

	// 사용자 명세 확인
	@RequestMapping(value = "/specificationListForm", method=RequestMethod.GET)
	public String specificationListForm(HttpSession session, Model model) {

		String id = (String) session.getAttribute("userId");
		UserVO user = service.selectUserTest(id);
		
		ArrayList<HashMap<Object, Object>> list = service.selectSpecAll(user);
		System.out.println("명세 :" + list);
		model.addAttribute("list", list);
		return "deal/deal_specificationListForm";
	}

	@RequestMapping(value = "/selectProdOne", method=RequestMethod.GET)
	public String selectProdOne(specVO vo, Model model) {
		specVO spec = service.selectSpecOne(vo.getSpecNum());
		dealHistoryVO deal = service.selectDealOne(vo.getSpecNum());
		
		model.addAttribute("deal", deal);
		model.addAttribute("spec", spec);
		return "deal/deal_purchaseForm";
	}
	
	@RequestMapping(value = "/CartProdOne", method=RequestMethod.POST)
	public String CartProdOne(specVO vo) {
		
		ChatVO chat = service.selectChId(vo.getChId());
		//System.out.println(chat);
		vo.setChNum(chat.getChNum());
		//System.out.println("specccccccc vo" + vo);
		service.insertCartSpec(vo);
		//specVO spec = service.selectSpecOne(vo.getSpecNum());
		//System.out.println(spec);
		//model.addAttribute("spec", spec);
		return "redirect:/user/specificationListForm";
	}

	@RequestMapping(value = "/removeSpecOne", method=RequestMethod.GET)
	public String removeSpecOne(specVO vo) {
		
		return service.removeSpecOne(vo.getSpecNum());
	}
	
	@RequestMapping(value = "/purchaseOne", method=RequestMethod.POST)
	public String purchaseOne(specVO vo) {
		System.out.println("구매 정보 : " + vo);
		return service.purchaseOne(vo);
	}
	
	@RequestMapping(value = "/deal_shoppingClear", method=RequestMethod.GET)
	public String deal_shoppingClear() {
		
		return "deal/deal_shoppingClear";
	}
	
	@RequestMapping(value = "/deal_shoppingFail", method=RequestMethod.GET)
	public String deal_shoppingFail() {
		
		return "deal/deal_shoppingFail";
	}
	
	@RequestMapping(value = "/updateStatus", method=RequestMethod.POST)
	public String updateStatus(specVO vo) {
		System.out.println(vo);
		dealHistoryVO deal = service.selectDealOne(vo.getSpecNum());
		String path = "redirect:/user/specificationListForm";
		if(deal != null) {
			path =service.updateStatus(vo.getSpecNum());
		}
		
		
		return path;
	}
	
}
