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
}
