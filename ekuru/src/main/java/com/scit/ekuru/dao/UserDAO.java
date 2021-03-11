package com.scit.ekuru.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.ekuru.vo.ChargePointVO;
import com.scit.ekuru.vo.UserVO;


@Repository
public class UserDAO {

	@Autowired
	private SqlSession session;
	
	public int insertUser(UserVO vo) {
		int cnt = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.insertUser(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public UserVO loginUser(UserVO vo) {
		UserVO Uservo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			Uservo = mapper.loginUser(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return Uservo;
	}
	
	public UserVO selectUser(String id) {
		UserVO Uservo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			Uservo = mapper.selectUser(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return Uservo;
	}
	
	public int modifyUser(UserVO vo) {
		int count = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			count = mapper.modifyUser(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<HashMap<String, Object>> selectPoint(String id) {
		ArrayList<HashMap<String, Object>> vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectPoint(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public ArrayList<HashMap<String, Object>> selectCart(String id){
		ArrayList<HashMap<String, Object>> vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectCart(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public ArrayList<HashMap<Object, Object>> selectChatRoom(String id){
		ArrayList<HashMap<Object, Object>> vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectChatRoom(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int modifyAuthkey(UserVO vo) {
		int count = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			count = mapper.modifyAuthkey(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int updateConfirm(UserVO vo) {
		int count = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			count = mapper.updateConfirm(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
}
