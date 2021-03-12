package com.scit.ekuru.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.ekuru.dao.ChannelDAO;
import com.scit.ekuru.vo.ChannelVO;
import com.scit.ekuru.vo.ProductVO;

@Service
public class ChannelService {

	@Autowired
	private ChannelDAO dao;

	public ArrayList<ChannelVO> getListAll() {

		return dao.getListAll();
	}

	public ChannelVO chRead(String chId) {
		return dao.chRead(chId);
	}

	public ArrayList<ProductVO> getProdList(String chId) {
		return dao.getProdList(chId);
	}

	public ProductVO getProdEach(ProductVO prodVo) {
		return dao.getProdEach(prodVo);
	}

	public void ch_posters_Write(ProductVO vo) {
		dao.ch_posters_Write(vo);

	}

	public HashMap<String, Object> prodDelete(HashMap<String, Object> json) {
		int prodNum = (int) json.get("prodNum");
		boolean check = dao.prodDelete(prodNum);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("check", check);

		return result;
	}
}
