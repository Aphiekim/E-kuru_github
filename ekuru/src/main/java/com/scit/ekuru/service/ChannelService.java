package com.scit.ekuru.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.ekuru.dao.ChannelDAO;
import com.scit.ekuru.vo.ChannelVO;
import com.scit.ekuru.vo.ProductCommentVO;
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

//	상품 삭제
	public HashMap<String, Object> prodDelete(HashMap<String, Object> json) {
		int prodNum = (int) json.get("prodNum");
		boolean check = dao.prodDelete(prodNum);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("check", check);

		return result;
	}

	public ArrayList<ProductCommentVO> getProdComment(int prodNum) {
		ArrayList<ProductCommentVO> commentResult = dao.getProdComment(prodNum);
		return commentResult;
	}

//	채널 댓글 창 입력 위한 유저 타입 가져오기
	public String getUserType(String userId) {
		String userResult = dao.getUserType(userId);
		return userResult;
	}

//	상품 댓글 추가
	public HashMap<String, Object> addComment(HashMap<String, Object> json) {
        String userId = (String) json.get("userId");
        int prodNum = (int) json.get("prodNum");
        String prodComment = (String) json.get("prodComment");

        ProductCommentVO commentVo = new ProductCommentVO();
        commentVo.setUserId(userId);
        commentVo.setProdNum(prodNum);
        commentVo.setProdComment(prodComment);

        int prodCommentNum = dao.addComment(commentVo);

        HashMap<String, Object> result = new HashMap<String, Object>();
        result.put("prodCommentNum", prodCommentNum);

		return result;
	}
}
