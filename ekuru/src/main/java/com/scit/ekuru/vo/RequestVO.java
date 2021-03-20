package com.scit.ekuru.vo;

import lombok.Data;

@Data
public class RequestVO {
	private int reqNum;
	private String userId;
	private int categoryCode;
	private String reqTitle;
	private String reqContent;
	private String reqOriginalPic1;
	private String reqOriginalPic2;
	private String reqOriginalPic3;
	private String reqIndate;
}
