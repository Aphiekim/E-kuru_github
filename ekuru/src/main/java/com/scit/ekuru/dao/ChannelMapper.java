package com.scit.ekuru.dao;

import java.util.ArrayList;

import com.scit.ekuru.vo.ChannelVO;
import com.scit.ekuru.vo.ProductCommentVO;
import com.scit.ekuru.vo.ProductVO;
import com.scit.ekuru.vo.categoryVO;

public interface ChannelMapper {

	public ArrayList<ChannelVO> getListAll();

	public ChannelVO chRead(String chId);

	public ArrayList<ProductVO> getProdList(String chId);

	public ProductVO getProdEach(ProductVO prodVo);

	public void ch_posters_Write(ProductVO vo);

	public boolean prodDelete(int prodNum);

	public ArrayList<ProductCommentVO> getProdComment(int prodNum);

	public String getUserType(String userId);

	public int addComment(ProductCommentVO commentVo);

	public ArrayList<ChannelVO> chCategoryResult(int categoryCode);

	public ArrayList<ChannelVO> chSearch(String search);

	public categoryVO getCategory(ProductVO prodVo);

	public boolean contentModify(ProductVO vo);

	public boolean chModify(ChannelVO vo);

	//AD 관련 채널글 출력
	public ArrayList<ChannelVO> selectChAd();
	
	//메인화면 검색 채널글 출력
	public ArrayList<ProductVO> selectProdAll(String search);
}
