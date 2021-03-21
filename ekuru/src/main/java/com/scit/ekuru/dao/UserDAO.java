package com.scit.ekuru.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public ArrayList<HashMap<Object, Object>> selectChatRoom(ChatVO vo){
		ArrayList<HashMap<Object, Object>> list = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.selectChatRoom(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ChatVO selectChat(int chatNum){
		ChatVO vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectChat(chatNum);
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

	// 포인트 상품 조회
	public PointProductVO selectPointPricing(int pointProdNum) {
		PointProductVO pvo = null;

		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			pvo = mapper.selectPointPricing(pointProdNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pvo;
	}

	// 회원 포인트 수정
	public int updatePoint(UserVO vo) {
		int cnt = 0;

		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.updatePoint(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	// 포인트 충전 내역 기록
	public int insertPoint(PointVO vo) {
		int cnt = 0;

		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.insertPoint(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;
	}

	public int updateChat(ChatVO vo) {
		int cnt = 0;

		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.updateChat(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cnt;

	}

	public ChatVO selectChUser1(String id) {
		ChatVO vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectChUser1(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public ChatVO selectChUser2(String id) {
		ChatVO vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectChUser2(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public ChatVO selectChatRoomOne(int chatNum) {
		ChatVO vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectChatRoomOne(chatNum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public dealHistoryVO selectDealOne(int specNum) {
		dealHistoryVO vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectDealOne(specNum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public ArrayList<HashMap<String, Object>> dealHistory(String userId) {
		ArrayList<HashMap<String, Object>> result = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.dealHistory(userId);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	public ArrayList<HashMap<Object, Object>> selectProdList(){
		ArrayList<HashMap<Object, Object>> list = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.selectProdList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean addCart(CartVO vo) {
		boolean check = false;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			check = mapper.addCart(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public int removeCart(int cartprodnum) {
		int cnt = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.removeCart(cartprodnum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ChatVO selectChid(String id){
		ChatVO vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectChid(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int createChatRoom(ChatVO vo){
		int count = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			count = mapper.createChatRoom(vo);
			count += mapper.createChat(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int insertUsedPoint(PointUsedVO vo) {
		int cnt = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.insertUsedPoint(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public ArrayList<PointUsedVO> selectUsedPointList(String id){
		ArrayList<PointUsedVO> list = null;
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.selectUsedPointList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ChatVO selectBuyer(int chatNum){
		ChatVO vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectBuyer(chatNum);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	public int insertReqAd(SuperPlanVO vo) {
		int cnt = 0;
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.insertReqAd(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int insertSpec(specVO vo) {
		int cnt = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.insertSpec(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int insertChAd(SuperPlanVO vo) {
		int cnt = 0;
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.insertChAd(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	

	public ArrayList<HashMap<String, Object>> selectSearchAll(String search){
		ArrayList<HashMap<String, Object>> list = null;
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.selectSearchAll(search);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public ArrayList<HashMap<Object, Object>> selectSepcAll1(UserVO user){
		ArrayList<HashMap<Object, Object>> list = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.selectSpecAll1(user);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<HashMap<Object, Object>> selectSepcAll2(UserVO user){
		ArrayList<HashMap<Object, Object>> list = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.selectSpecAll2(user);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

	// 명세 조회
	public specVO selectSpecOne(int specNum) {
		specVO vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.selectSpecOne(specNum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public int removeSpecOne(int specNum){
		int count = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			count = mapper.removeSpecOne(specNum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int purchaseOne(dealHistoryVO vo){
		int count = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			count = mapper.purchaseOne(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int updateStatus(int specNum) {
		int count = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			count = mapper.updateStatus(specNum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
