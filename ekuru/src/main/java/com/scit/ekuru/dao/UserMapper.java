package com.scit.ekuru.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.scit.ekuru.vo.CartVO;
import com.scit.ekuru.vo.ChargePointVO;
import com.scit.ekuru.vo.ChatVO;
import com.scit.ekuru.vo.PointProductVO;
import com.scit.ekuru.vo.PointUsedVO;
import com.scit.ekuru.vo.PointVO;
import com.scit.ekuru.vo.SuperPlanVO;
import com.scit.ekuru.vo.UserVO;
import com.scit.ekuru.vo.dealHistoryVO;
import com.scit.ekuru.vo.specVO;

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

	// 채팅방 조회
	public ChatVO selectChatRoomOne(int chatNum);
	
	// 채팅 조회
	public ChatVO selectChat(int chatNum);

	// 특정 채널 유저의 정보 조회
	public ChatVO selectChUser1(String id);

	// ChatVO로 유저 정보 조회
	public ChatVO selectChUser2(String id);

	// 거래 내역
	public ArrayList<HashMap<String, Object>> dealHistory(String userId);

	// 전체 상품 조회
	public ArrayList<HashMap<Object, Object>> selectProdList();

//	장바구니 추가
	public boolean addCart(CartVO vo);

	//장바구니 삭제
	public int removeCart(int cartprodnum);
	
	// 채널 유저 조회
	public ChatVO selectChid(String id);
	
	// 채팅방 생성
	public int createChatRoom(ChatVO vo);
	
	// 채팅생성
	public int createChat(ChatVO vo);
	
	//사용된 포인트 테이블에 추가
	public int insertUsedPoint(PointUsedVO vo);
	
	//사용된 포인트 불러오기
	public ArrayList<PointUsedVO> selectUsedPointList(String id);
	
	// 명세폼으로 넘길 구매자의 아이디
	public ChatVO selectBuyer(int chatNum);
	
	// 명세 작성
	public int insertSpec(specVO vo);
	
	// 명세 조회
	public ArrayList<HashMap<Object, Object>> selectSpecAll1(UserVO user);
	
	// 판매자 조회
	public ArrayList<HashMap<Object, Object>> selectSpecAll2(UserVO user);
	
	//AD 수퍼플랜에 넣기 요청글(구매자용)
	public int insertReqAd(SuperPlanVO vo);
	
	//AD 수퍼플랜에 넣기 채널용
	public int insertChAd(SuperPlanVO vo);
	

	//첫 메인화면에서 검색
	public ArrayList<HashMap<String, Object>> selectSearchAll(String search);

	// 명세 조회
	public specVO selectSpecOne(int specNum);

	// 명세 삭제
	public int removeSpecOne(int specNum);
	
	// 구매 처리
	public int purchaseOne(dealHistoryVO vo);
	
	// 상품 배송 상태 수정
	public int updateStatus(int specNum);
	
	//거래내역 조회
	public dealHistoryVO selectDealOne(int specNum);
}
