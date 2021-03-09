package com.scit.ekuru.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.scit.ekuru.vo.ChargePointVO;
import com.scit.ekuru.vo.UserVO;

public interface UserMapper {

	// 회원등록
	public int insertUser(UserVO vo);
	
	// 로그인
	public UserVO loginUser(UserVO vo);
	
	// 유저 정보 조회
	public UserVO selectUser(String id);
	
	// 정보 수정
	public int modifyUser(UserVO vo);

	// 권환키 설정
	public int modifyAuthkey(UserVO vo);

	// 유저 인증 정보 수정
	public int updateConfirm(UserVO vo);
	
	// 포인트 충전 내역
	public ArrayList<HashMap<String, Object>> selectPoint(String id);
	
	// 장바구니 조회
	public ArrayList<HashMap<String, Object>> selectCart(String id);
}
