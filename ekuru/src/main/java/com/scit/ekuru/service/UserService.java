package com.scit.ekuru.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.scit.ekuru.dao.UserDAO;
import com.scit.ekuru.vo.ChargePointVO;
import com.scit.ekuru.vo.UserVO;


@Service
public class UserService {

	@Autowired
	private UserDAO dao;

	Model model;

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
<<<<<<< HEAD
		}else {

			
//			String text = Uservo.getUserAddr();
//			String addr[] = text.split("/");
//			
//			ArrayList<HashMap<Object, Object>> list = new ArrayList<HashMap<Object, Object>>();
//			HashMap<Object, Object> hash = new HashMap<Object, Object>();
			
//	        hash.put("state", addr[0]);
//	        hash.put("address1", addr[1]);
//	        hash.put("address2", addr[2]);
//	        list.add(hash);
			 
//	        session.setAttribute("state", list.get(0).get("state"));
//	        session.setAttribute("addr1", list.get(0).get("address1"));
//	        session.setAttribute("addr2", list.get(0).get("address2"));
	        session.setAttribute("user", Uservo);
			session.setAttribute("userId", Uservo.getUserId());

	        session.setAttribute("userNm", Uservo.getUserNm());
	        session.setAttribute("userId", Uservo.getUserId());

=======
		}else {;
	        session.setAttribute("userNm", Uservo.getUserNm());
	        session.setAttribute("userId", Uservo.getUserId());
>>>>>>> origin/master
			path = "redirect:/";
		}
		return path;
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

	        if(text != null && text.length() != 0) {
	        	String addr[] = text.split("/");
	        	hash.put("state", addr[0]);
		        hash.put("address1", addr[1]);
		        hash.put("address2", addr[2]);
		        hash.put("user", Uservo);
	        }

		}
        return hash;
	}
	
	public ArrayList<HashMap<String, Object>> selectCart(){
		ArrayList<HashMap<String, Object>> list = dao.selectCart((String)session.getAttribute("userId"));
		//System.out.println(list);
		return list;
	}
}
