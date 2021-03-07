package com.scit.ekuru.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.ekuru.dao.RequestDAO;
import com.scit.ekuru.vo.RequestVO;

@Service
public class RequestService {

	@Autowired
	private RequestDAO dao;
	
	public ArrayList<RequestVO> requestCategoryResult(int categoryCode) {
		return dao.requestCategoryResult(categoryCode);
	}
	
	public int insertRequest(RequestVO reqVO) {
		return dao.insertRequest(reqVO);
	}
}
