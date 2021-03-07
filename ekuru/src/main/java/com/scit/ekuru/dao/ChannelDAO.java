package com.scit.ekuru.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.ekuru.vo.ChannelVO;
import com.scit.ekuru.vo.UserVO;

@Repository
public class ChannelDAO {

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

	public ArrayList<ChannelVO> getListAll() {
		ArrayList<ChannelVO> list = null;
		try {
			ChannelMapper mapper = session.getMapper(ChannelMapper.class);
			list = mapper.getListAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
