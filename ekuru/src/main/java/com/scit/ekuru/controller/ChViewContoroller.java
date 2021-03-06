package com.scit.ekuru.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/channel")
public class ChViewContoroller {

//	채널 메인으로 가기
	@RequestMapping(value="/ch_main")
	public String chMain(){
		return "channel/ch_main";
	}

//	채널 게시판으로 가기 (구매자)
	@RequestMapping(value="/ch_content")
	public String chContent(){
		return "channel/ch_content";
	}

//	채널 게시판으로 가기 (판매자)
	@RequestMapping(value="/ch_content_seller")
	public String chContentSeller(){
		return "channel/ch_content_seller";
	}


//	채널 게시판으로 가기 (판매자)
	@RequestMapping(value="/ch_categoryresult")
	public String chCategoryResult(){
		return "channel/ch_categoryresult";
	}

//	채널 게시글 쓰기
	@RequestMapping(value="/ch_posters")
	public String chPosters(){
		return "channel/ch_posters";
	}

//	채널 검색 결과
	@RequestMapping(value="/ch_search")
	public String chSearch(){
		return "channel/ch_search";
	}

//	나의 채널 수정
	@RequestMapping(value="/ch_management")
	public String chManagement(){
		return "channel/ch_management";
	}


}
