package com.scit.ekuru.dao;

import com.scit.ekuru.vo.UserVO;

public interface UserMapper {

	// 회원등록
	public int insertUser(UserVO vo);
	
	// 로그인
	public UserVO loginUser(UserVO vo);
}
