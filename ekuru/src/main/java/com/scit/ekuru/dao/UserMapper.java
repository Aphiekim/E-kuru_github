package com.scit.ekuru.dao;

import java.util.ArrayList;

import com.scit.ekuru.vo.ChargePointVO;
import com.scit.ekuru.vo.UserVO;

public interface UserMapper {

	// 회원등록
	public int insertUser(UserVO vo);
	
	// 로그인
	public UserVO loginUser(UserVO vo);
	
	// 포인트 충전 내역
	public ArrayList<ChargePointVO> selectPoint(String id);
}
