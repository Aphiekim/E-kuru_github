package com.scit.ekuru.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.scit.ekuru.dao.UserDAO;
import com.scit.ekuru.util.MailUtils;
import com.scit.ekuru.util.Tempkey;
import com.scit.ekuru.vo.ChargePointVO;
import com.scit.ekuru.vo.PointProductVO;
import com.scit.ekuru.vo.ChatVO;
import com.scit.ekuru.vo.UserVO;


@Service
public class UserService {

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
<<<<<<< HEAD
	        session.setAttribute("userPoint", Uservo.getUserPoint());
			path = "redirect:/";
=======
	        // 인증여부 확인용 session.setAttribute("userId", Uservo.getUserId());
	 
	        if(Uservo.getUserConfirm().equals("0")) {
	        	path = "redirect:/user/mypage_Info";
	        }else {
	        	path = "redirect:/";
	        }
>>>>>>> 58fa899df969caacc690ff83b00e9c761be92434
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
		

		String path = "";
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
	
	public ArrayList<HashMap<Object, Object>> selectChatRoom(){
		String id = (String) session.getAttribute("userId");
		ArrayList<HashMap<Object, Object>> list = dao.selectChatRoom(id);
		HashMap<Object, Object> texthash = null;
		HashMap<Object, Object> test = null;
		
		for(int i = 0; i < list.size(); i++) {
			test = new HashMap<Object,Object>();
			
			String content = (String)list.get(i).get("CONTENT");
			String text[] = content.split("/");
			
//			System.out.println(text.length);
//			System.out.println(text[0] + text[1] + text[2]);
			
			//texthash = new HashMap<Object, Object>();
			//texthash.put("CONTENT", text[1]);
			
			// 반복문으로 list 하나씩 test 해시에 저장
			test = list.get(i);
			
			// 기존에 한 문장으로 저장된 채팅내용은 삭제
			test.remove("CONTENT");
			
			// 마지막에 기록된 채팅, 날짜를 가져와서 새로운 키값으로 저장
			test.put("text", text[1]);
			test.put("date", text[2]);
			
			System.out.println(test);
			
			//수정된 해시를 다시 기존 list에 set하여 저장
			//그러면 채팅방 목록에서 채팅 보낸 날짜와 마지막 채팅내용을 출력할수 있음
			list.set(i, test);
			System.out.println(list);
			
			//texthash.put("date", text[2]);
			//list.add(texthash);
			//list.get(i).s
			//System.out.println(texthash);
			//list.add(texthash);
		}
		
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
}
