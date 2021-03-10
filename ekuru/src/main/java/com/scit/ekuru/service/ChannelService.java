package com.scit.ekuru.service;

import java.util.ArrayList;

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

	public ChannelVO chRead(ChannelVO vo) {
		return dao.chRead(vo);
	}

	public ArrayList<ProductVO> getProdList(ChannelVO vo) {
		return dao.getProdList(vo);
	}

	public ProductVO getProdEach(ProductVO prodVo) {
		return dao.getProdEach(prodVo);
	}

	public void ch_posters_Write(ProductVO vo) {
		dao.ch_posters_Write(vo);

	}

	public void prodDelete(ProductVO vo) {
		dao.prodDelete(vo);
	}

}
