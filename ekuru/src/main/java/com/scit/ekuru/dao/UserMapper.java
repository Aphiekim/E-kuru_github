package com.scit.ekuru.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.scit.ekuru.vo.ChargePointVO;
import com.scit.ekuru.vo.ChatVO;
import com.scit.ekuru.vo.PointProductVO;
import com.scit.ekuru.vo.PointVO;
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

	// 포인트 상품 목록 조회
	public PointProductVO selectPointPricing(int pointProdNum);

	//포인트 충전 내역 기록
	public int insertPoint(PointVO vo);

	// 회원 포인트 수정
	public int updatePoint(UserVO vo);

	// 채팅 수정(채팅 입력했을때)
	public int updateChat(ChatVO vo);

	// 채팅방 조회
	public ArrayList<HashMap<Object, Object>> selectChatRoom(ChatVO vo);

	// 채팅 조회
	public ChatVO selectChat(int chatNum);

	// 특정 채널 유저의 정보 조회
	public ChatVO selectChUser1(String id);

	// ChatVO로 유저 정보 조회
	public ChatVO selectChUser2(String id);

	// 거래 내역
	public ArrayList<HashMap<String, Object>> dealHistory(String userId);
}
