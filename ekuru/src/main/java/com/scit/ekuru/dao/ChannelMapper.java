package com.scit.ekuru.dao;

import java.util.ArrayList;

import com.scit.ekuru.vo.ChannelVO;
import com.scit.ekuru.vo.ProductVO;

public interface ChannelMapper {

	public ArrayList<ChannelVO> getListAll();

	public ChannelVO chRead(String chId);

	public ArrayList<ProductVO> getProdList(String chId);

	public ProductVO getProdEach(ProductVO prodVo);

	public void ch_posters_Write(ProductVO vo);

	public boolean prodDelete(int prodNum);

}
