package com.scit.ekuru.vo;

import lombok.Data;

@Data
public class UserVO {
	private String userId;
	private String userPw;
	private String userNm;
	private String userAddr;
	private String userZip;
	private String userPhone;
	private char userConfirm;
	private char userType;
	private int userPoint;
}
