package com.scit.ekuru.service;

<<<<<<< HEAD
import org.springframework.stereotype.Service;

@Service
public class UserService {
=======
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.ekuru.dao.UserDAO;
import com.scit.ekuru.vo.UserVO;
>>>>>>> origin/master


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
			path = "redirect:/member/joinForm";
		}
		return path;
	}
}
