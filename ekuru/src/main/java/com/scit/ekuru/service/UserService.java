package com.scit.ekuru.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.scit.ekuru.controller.PaymentController;
import com.scit.ekuru.dao.UserDAO;
import com.scit.ekuru.util.MailUtils;
import com.scit.ekuru.util.Tempkey;
import com.scit.ekuru.vo.CartVO;
import com.scit.ekuru.vo.ChargePointVO;
import com.scit.ekuru.vo.PointProductVO;
import com.scit.ekuru.vo.PointVO;
import com.scit.ekuru.vo.ChatVO;
import com.scit.ekuru.vo.UserVO;


@Service
public class UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserService.class);

	@Autowired
	private UserDAO dao;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private HttpSession session;

	public String insertUser(UserVO vo) {
		int cnt = dao.insertUser(vo);
		String path = "";

		if(cnt > 0) {
			path = "redirect:/";
		}else {
			path = "redirect:/user/joinForm";
		}
		return path;
	}

	public String loginUser(UserVO vo) {
		UserVO Uservo = dao.loginUser(vo);

		String path = "";
		if(Uservo == null) {
			path = "redirect:/user/loginForm";
		}else {

	        session.setAttribute("userNm", Uservo.getUserNm());
	        session.setAttribute("userId", Uservo.getUserId());
	        session.setAttribute("userPoint", Uservo.getUserPoint());
			path = "redirect:/";

	        // 인증여부 확인용 session.setAttribute("userId", Uservo.getUserId());

	        if(Uservo.getUserConfirm().equals("0")) {
	        	path = "redirect:/user/mypage_Info";
	        }else {
	        	path = "redirect:/";
	        }

		}
		return path;
	}

	public UserVO selectUserTest(String id) {
		UserVO Uservo = dao.selectUser(id);
		return Uservo;
	}

	public void logout() {
		session.removeAttribute("userNm");
		session.removeAttribute("userId");
		session.removeAttribute("userPoint");
	}

	public String modifyUser(UserVO vo) {
		vo.setUserId((String)session.getAttribute("userId"));
		int count = dao.modifyUser(vo);
		String path = "";
		if(count == 0) {
			path = "redirect:/user/mypage_InfoForm";
		}else {
			path = "redirect:/user/mypage_Info";
		}
		return path;
	}

	public ArrayList<HashMap<String, Object>> selectPoint() {
		String id = (String) session.getAttribute("userId");
		ArrayList<HashMap<String, Object>> list = dao.selectPoint(id);

		return list;
	}

	public HashMap<Object, Object> selectUser(String id) {
		UserVO Uservo = dao.selectUser(id);
		System.out.println(Uservo);



		HashMap<Object, Object> hash = null;

		if(Uservo == null){
			System.out.println("유저 VO를 가져오지 못했습니다");
		}else {

			String text = Uservo.getUserAddr();
			hash = new HashMap<Object, Object>();

			String addr[] = {"", "", ""};

	        if(text != null && text.length() != 0) {
	        	addr = text.split("/");
	        	System.out.println(addr.length);

	        }

	        hash.put("state", addr[0]);
	        hash.put("address1", addr[1]);
	        hash.put("address2", addr[2]);
	        hash.put("user", Uservo);

		}
        return hash;
	}

	public ArrayList<HashMap<String, Object>> selectCart(){
		ArrayList<HashMap<String, Object>> list = dao.selectCart((String)session.getAttribute("userId"));
		//System.out.println(list);
		return list;
	}

	public String deleteCart(int CartProdNum){
		
		String path = "";
		int cnt = dao.removeCart(CartProdNum);
		
		if(cnt > 0) {
			path = "redirect:/user/mypageShopping";
		}else {
			path = "redirect:/";
		}
		
		return path;
	}
	
	public ArrayList<HashMap<Object, Object>> selectChatRoom(ChatVO vo){
		String id = (String) session.getAttribute("userId");
		ArrayList<HashMap<Object, Object>> list = dao.selectChatRoom(vo);
		HashMap<Object, Object> test = null;

		for(int i = 0; i < list.size(); i++) {
			test = new HashMap<Object,Object>();

			String content = (String)list.get(i).get("CONTENT");
			String text[] = content.split("/");

			// 반복문으로 list 하나씩 test 해시에 저장
			test = list.get(i);

			// 기존에 한 문장으로 저장된 채팅내용은 삭제
			test.remove("CONTENT");
			// 년 월 일 까지 짜름
			text[2] = text[2].substring(0, 10);
			// 마지막에 기록된 채팅, 날짜를 가져와서 새로운 키값으로 저장
			// 현재는 확인하기위해 첫 번째 채팅기록을 사용한 것
			test.put("text", text[1]);
			test.put("date", text[2]);

			//System.out.println(test);

			//수정된 해시를 다시 기존 list에 set하여 저장
			//그러면 채팅방 목록에서 채팅 보낸 날짜와 마지막 채팅내용을 출력할수 있음
			list.set(i, test);
			System.out.println(list);

		}

		return list;
	}

	public ArrayList<HashMap<Object, Object>> selectChat(ChatVO vo){

		ChatVO chat = dao.selectChat(vo.getChatNum());
		ArrayList<HashMap<Object, Object>> list = new ArrayList<HashMap<Object, Object>>();

		HashMap<Object, Object> hash;


		if(vo.getChatNum() == 0 || vo == null) {
			list = null;
			return list;
		}else {
			chat = dao.selectChat(vo.getChatNum());
			String test = null;
			test = chat.getContent();
			String content[] = test.split("/");
			for(int i = 0; i < content.length; i++) {
				hash = new HashMap<Object, Object>();
				hash.put("userid", content[i]);
				hash.put("content", content[i+1]);
				hash.put("date", content[i+2]);
				hash.put("chatNum", chat.getRoomNum());
				i += 2;
				list.add(hash);
				System.out.println(hash);
			}
		}
		System.out.println(list);
		return list;
	}

//	public ArrayList<HashMap<String, Object>> selectChat(){
//		String id = (String) session.getAttribute("userId");
//		ChatVO vo = dao.selectChatRoom(id);
//	    String text = vo.getContent();
//	    String arr[] = text.split("/");
//
//	    ArrayList<HashMap<Object, Object>> list = new ArrayList<HashMap<Object, Object>>();
//	    HashMap<Object, Object> content = null;
//
//	    for(int i = 0; i < arr.length; i++) {
//	    	content = new HashMap<Object, Object>();
//	    	content.put("userid", arr[i]);
//	        content.put("content", arr[i+1]);
//	        content.put("date", arr[i+2]);
//	        i += 2;
//	        list.add(content);
//	     }
//	}

	@Transactional
	public void Mailcreate() throws Exception {
		String id = (String) session.getAttribute("userId");
		UserVO vo = dao.selectUser(id);
		System.out.println(vo);
		// 임의의 authkey 생성
		String authkey = new Tempkey().getKey(50, false);
//
		System.out.println(authkey);
		vo.setAuthkey(authkey);
		dao.modifyAuthkey(vo);

		// mail 작성 관련
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8888/user/mailConfirm?"
						+ "userId="+ vo.getUserId()
						+ "&authkey=" + authkey
						+ "' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("ekuruco@gmail.com", "Ekuru-Team");
		sendMail.setTo(vo.getUserId());
		sendMail.setTo("tasd7070@naver.com");
		sendMail.send();
	}


	public String updateConfirm(UserVO vo) {
		int count = dao.updateConfirm(vo);
		String path = "";
		if(count == 0) {
			path = "redirect:/user/mypage_InfoForm";
		}else {
			path = "redirect:/user/mypage_Info";
		}
		return path;
	}

	// 포인트 상품 조회
	public PointProductVO selectPointPricing(int pointProdNum) {
		return dao.selectPointPricing(pointProdNum);
	}

	// 회원 포인트 수정
	public String updatePoint(UserVO vo) {
		int cnt = dao.updatePoint(vo);
		String path ="";
		if(cnt>0) {
			path ="redirect:/ad/superplan_clear";
		}else {
			path = "redirect:/ad/superplan_contract";
		}

		return path;
	}
	// 회원 포인트 충전 후 업데이트
	public int updateUserPoint(UserVO vo) {
		return dao.updatePoint(vo);
	}


	//회원 포인트 충전 내역 기입
	public String insertPoint(PointVO vo) {
		int cnt = dao.insertPoint(vo);
		String path ="";

		if(cnt>0) {
			logger.info("충전 내역 기입 성공");
			path="redirect:/user/mypage_paymentClear";
		}else {
			logger.info("충전 내역 기입 실패");
			path="redirect:/user/mypage_pointPricing";
		}

		return path;
	}

	public String updateChat(ChatVO vo) {
		//현재 시간을 가져옴
		SimpleDateFormat sysdate = new SimpleDateFormat ( "YYYY-MM-DD HH:mm:ss");
		Date time = new Date();
		String time1 = sysdate.format(time);

		//기존 채팅 내역을 가져오기 위함
		ChatVO chatvo = dao.selectChat(vo.getChatNum());

		String path ="";

		//기존에 있던 채팅내역과 입력한 채팅정보를 하나로 합침
		String text = chatvo.getContent() + vo.getUserId() + "/" + vo.getContent() + "/" + time1 + "/";

		//합친 정보를 vo에 저장
		vo.setContent(text);

		int cnt = dao.updateChat(vo);
		System.out.println(text);

		if(cnt > 0) {
			path = "redirect:/user/chatForm?chatNum=" + vo.getChatNum();
		}else {
			path = "redirect:/";
		}

		return path;

	}

	public ChatVO selectChUser1() {
		String id = (String) session.getAttribute("userId");
		ChatVO chatvo = dao.selectChUser1(id);

		return chatvo;
	}

	public ChatVO selectChUser2() {
		String id = (String) session.getAttribute("userId");
		ChatVO chatvo = dao.selectChUser2(id);

		return chatvo;
	}


	public void dealHistory(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		ArrayList<HashMap<String, Object>> result = dao.dealHistory(userId);
		model.addAttribute("result", result);

	}


	public ArrayList<HashMap<Object, Object>> selectProdList(){
		ArrayList<HashMap<Object, Object>> list = dao.selectProdList();
		//System.out.println(list);
		return list;
	}

	public void addCart(CartVO vo) {
		boolean check = false;
		check = dao.addCart(vo);
		if(check) {
			//logger.info("장바구니 담기 성공");
		}
	}
	public ChatVO selectChId (String id){
		return dao.selectChid(id);
	}
	
	public String createChatRoom (ChatVO vo){
		//현재 시간을 가져옴
		SimpleDateFormat sysdate = new SimpleDateFormat ( "YYYY-MM-DD HH:mm:ss");
		Date time = new Date();
		String time1 = sysdate.format(time);
		//vo.getUserId()로 하면 구매자가 요청버튼 눌렀을때
		//vo.getChId()로 하면 판매자가 요청버튼 눌렀을때
		vo.setContent(vo.getChId() + "/" + "Hello!" + "/" + time1);
		int count = dao.createChatRoom(vo);

		String path = "";
		if(count == 0) {
			path = "redirect:/";
		}else {
			path = "redirect:/user/chatForm";
		}
		return path;
	}
}

