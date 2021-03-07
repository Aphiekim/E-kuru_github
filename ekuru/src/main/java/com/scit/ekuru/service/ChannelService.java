package com.scit.ekuru.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.ekuru.dao.ChannelDAO;
import com.scit.ekuru.vo.ChannelVO;

@Service
public class ChannelService {

	@Autowired
	private ChannelDAO dao;

	public ArrayList<ChannelVO> getListAll() {

		return dao.getListAll();
	}

}
