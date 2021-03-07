package com.scit.ekuru.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scit.ekuru.service.ChannelService;
import com.scit.ekuru.vo.ChannelVO;


@Controller
@RequestMapping(value = "/channel")
public class ChViewContoroller {

	@Autowired
	private ChannelService service;

//	채널 메인 보기
	@RequestMapping(value="/ch_main")
	public String chMain(Model model){
		ArrayList<ChannelVO> chListResult = service.getListAll();
		model.addAttribute("chListResult", chListResult);
		return "channel/ch_main";
	}

//	채널 검색 결과 보기
	@RequestMapping(value="/ch_search")
	public String chSearch(){
		return "channel/ch_search";
	}

//	특정 카테고리만
	@RequestMapping(value="/ch_categoryresult")
	public String chCategoryResult(){
		return "channel/ch_categoryresult";
	}

//	개인 채널 보기
	@RequestMapping(value="/ch_personal_main")
	public String chPersonalMain(){
		return "channel/ch_personal_main";
	}

//	개인 채널 수정
	@RequestMapping(value="/ch_management")
	public String chManagement(){
		return "channel/ch_management";
	}

//	채널 게시글 쓰기
	@RequestMapping(value="/ch_posters")
	public String chPosters(){
		return "channel/ch_posters";
	}


//	채널 게시글 보기 (구매자)
	@RequestMapping(value="/ch_content")
	public String chContent(){
		return "channel/ch_content";
	}

//	채널 게시글 보기 (판매자)
	@RequestMapping(value="/ch_content_seller")
	public String chContentSeller(){
		return "channel/ch_content_seller";
	}








}
