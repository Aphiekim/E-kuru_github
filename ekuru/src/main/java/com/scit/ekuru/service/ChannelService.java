package com.scit.ekuru.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.scit.ekuru.controller.ChViewContoroller;
import com.scit.ekuru.dao.ChannelDAO;
import com.scit.ekuru.vo.ChannelVO;
import com.scit.ekuru.vo.FollowingVO;
import com.scit.ekuru.vo.ProductCommentVO;
import com.scit.ekuru.vo.ProductVO;
import com.scit.ekuru.vo.UserVO;
import com.scit.ekuru.vo.categoryVO;

@Service
public class ChannelService {

	private static final Logger logger = LoggerFactory.getLogger(ChViewContoroller.class);

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

//	상품 댓글 삭제
	public boolean deleteComment(HashMap<String, Object> json) {
        int prodCommentNum = (int) json.get("prodCommentNum");

        boolean check = dao.deleteComment(prodCommentNum);

        if(check) {
        	logger.info("삭제 성공");
        }

		return check;
	}

//	카테고리 별 리스트 출력
	public void chCategoryResult(Model model, int categoryCode) {
		ArrayList<ChannelVO> listResult = dao.chCategoryResult(categoryCode);
		ArrayList<ChannelVO> chListResult = dao.getListAll();
		model.addAttribute("chListResult", chListResult);
		model.addAttribute("listResult", listResult);
	}

//	채널 검색 결과
	public void chSearch(String search, Model model) {
		ArrayList<ChannelVO> searchResult = dao.chSearch(search);
		ArrayList<ChannelVO> chListResult = dao.getListAll();
		ArrayList<ChannelVO> adChList = dao.selectChAd();

		System.out.println(searchResult);

		model.addAttribute("chListResult", chListResult);
		model.addAttribute("searchResult", searchResult);
		model.addAttribute("adChList", adChList);
	}

//	카테고리 정보 가져오기
	public void getCategory(ProductVO prodVo, Model model) {
		categoryVO categoryResult = dao.getCategory(prodVo);
		model.addAttribute("categoryResult", categoryResult);
	}

	public void contentModify(ProductVO vo) {
		boolean result = dao.contentModify(vo);
		if(result) {
			logger.info("상품수정완료");
		}

	}

	public void chModify(ChannelVO vo) {
		boolean result = dao.chModify(vo);
		if(result) {
			logger.info("채널수정완료");
		}

	}

	public ArrayList<ProductVO> selectProdAll(String search){
		return dao.selectProdAll(search);
	}

	public void chCreate(String id) {
		boolean result = dao.chCreate(id);
		if(result) {
			logger.info("채널 생성");
		}

	}

	public String chVerify(String chId) {
		String result = dao.chVerify(chId);
		return result;
	}

	public void chFollow(FollowingVO fVo) {
		boolean result = dao.chFollow(fVo);
		if(result) {
			logger.info("팔로우 완료");
		}

	}

	public String fCheck(String userId, HttpSession session) {
		ArrayList<UserVO> fCheck = dao.fCheck(userId);
		String id = (String) session.getAttribute("userId");
		String result = null;
		for (UserVO userVO : fCheck) {
			if(userVO.getUserId().equals(id)) {
				result = userVO.getUserId();
			}
		}

		return result;
	}

	public ArrayList<ChannelVO> selectChAd(){
		ArrayList<ChannelVO> list = dao.selectChAd();

		if(list.size()!=0|| list !=null) {
			logger.info("AD 채널 불러오기 성공 : {}",list);
		}

		return list;
	}

	public void channelFollowing(HttpSession session, Model model) {

		String userId = (String) session.getAttribute("userId");
		ArrayList<ChannelVO> channelResult = dao.channelFollowing(userId);
		System.out.println(channelResult);
		model.addAttribute("channelResult", channelResult);
	}

	public void deleteFollowingList(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		boolean result = dao.deleteFollowingList(userId);

		if(result) {
			logger.info("팔로잉 리스트 삭제 성공");
		}

	}
}
