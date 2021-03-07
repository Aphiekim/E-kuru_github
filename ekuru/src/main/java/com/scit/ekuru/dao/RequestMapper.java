package com.scit.ekuru.dao;

import java.util.ArrayList;

import com.scit.ekuru.vo.RequestVO;

public interface RequestMapper {

	public ArrayList<RequestVO> requestCategoryResult(int categoryCode);
	
	public int insertRequest(RequestVO reqVO);
}
