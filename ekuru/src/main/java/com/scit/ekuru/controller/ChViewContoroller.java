package com.scit.ekuru.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/channel")
public class ChViewContoroller {

	@RequestMapping(value="/ch_content")
	public String chContent(){
		return "channel/ch_content";
	}

}
