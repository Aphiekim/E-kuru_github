package com.scit.ekuru.dao;

import java.util.ArrayList;

import com.scit.ekuru.vo.ChannelVO;
import com.scit.ekuru.vo.ProductVO;

public interface ChannelMapper {

	public ArrayList<ChannelVO> getListAll();

	public ChannelVO chRead(ChannelVO vo);

	public ArrayList<ProductVO> getProdList(ChannelVO vo);

	public ProductVO getProdEach(ProductVO prodVo);

	public void ch_posters_Write(ProductVO vo);

	public void prodDelete(ProductVO vo);

}
