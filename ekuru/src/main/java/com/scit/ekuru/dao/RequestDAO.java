package com.scit.ekuru.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.ekuru.vo.RequestVO;

@Repository
public class RequestDAO {

	@Autowired
	private SqlSession session;
	
	public ArrayList<RequestVO> requestCategoryResult(int categoryCode) {
		ArrayList<RequestVO> list = null;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.requestCategoryResult(categoryCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int insertRequest(RequestVO reqVO) {
		int cnt = 0;
		
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			cnt = mapper.insertRequest(reqVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
		
	}
}
