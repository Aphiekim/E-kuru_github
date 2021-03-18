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
	private String userConfirm;
	private String userType;
	private int userPoint;
	private String authkey;
	private String userProfile;
}
