package com.scit.ekuru.vo;

import lombok.Data;

@Data
public class RequestCommentVO {
	private int reqCommentNum;
	private String userId;
	private int reqNum;
	private String reqComment;
}
