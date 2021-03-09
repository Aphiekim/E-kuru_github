package com.scit.ekuru.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.ekuru.vo.ChannelVO;
import com.scit.ekuru.vo.ProductVO;

@Repository
public class ChannelDAO {

	@Autowired
	private SqlSession session;

	public ArrayList<ChannelVO> getListAll() {
		ArrayList<ChannelVO> list = null;
		try {
			ChannelMapper mapper = session.getMapper(ChannelMapper.class);
			list = mapper.getListAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ChannelVO chRead(ChannelVO vo) {

		ChannelVO list = null;

		try {
			ChannelMapper mapper = session.getMapper(ChannelMapper.class);
			list = mapper.chRead(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<ProductVO> getProdList(ChannelVO vo) {
		ArrayList<ProductVO> list = null;

		try {
			ChannelMapper mapper = session.getMapper(ChannelMapper.class);
			list = mapper.getProdList(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public ProductVO getProdEach(ProductVO prodVo) {
		ProductVO list = null;

		try {
			ChannelMapper mapper = session.getMapper(ChannelMapper.class);
			list = mapper.getProdEach(prodVo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public void ch_posters_Write(ProductVO vo) {

		try {
			ChannelMapper mapper = session.getMapper(ChannelMapper.class);
			mapper.ch_posters_Write(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

//	상품 삭제
	public void prodDelete(ProductVO vo) {
		try {
			ChannelMapper mapper = session.getMapper(ChannelMapper.class);
			mapper.prodDelete(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
