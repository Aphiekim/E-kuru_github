package com.scit.ekuru.dao;

import java.util.ArrayList;

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
	
	public ArrayList<ChargePointVO> selectPoint(String id) {
		ArrayList<ChargePointVO> vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectPoint(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
}
