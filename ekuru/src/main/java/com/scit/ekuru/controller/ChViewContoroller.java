package com.scit.ekuru.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scit.ekuru.service.ChannelService;
import com.scit.ekuru.vo.ChannelVO;
import com.scit.ekuru.vo.FollowingVO;
import com.scit.ekuru.vo.ProductCommentVO;
import com.scit.ekuru.vo.ProductVO;
import com.scit.ekuru.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value = "/channel")
public class ChViewContoroller {

	private static final Logger logger = LoggerFactory.getLogger(ChViewContoroller.class);

	@Autowired
	private ChannelService service;

//	채널 메인 보기
	@RequestMapping(value = "/ch_main")
	public String chMain(Model model) {
		ArrayList<ChannelVO> chListResult = service.getListAll();
		ArrayList<ChannelVO> adChList = service.selectChAd();

		model.addAttribute("chListResult", chListResult);
		model.addAttribute("adChList", adChList);
		return "channel/ch_main";
	}

//	채널 검색 결과 보기
	@RequestMapping(value = "/ch_search", method = RequestMethod.POST)
	public String chSearch(@RequestParam(defaultValue = "") String search, Model model) {
		service.chSearch(search, model);
		ArrayList<ChannelVO> adChList = service.selectChAd();
		model.addAttribute("adChList", adChList);
		return "channel/ch_search";
	}

//	특정 카테고리만
	@RequestMapping(value = "/ch_categoryresult", method = RequestMethod.GET)
	public String chCategoryResult(int categoryCode, Model model) {
		service.chCategoryResult(model, categoryCode);
		ArrayList<ChannelVO> adChList = service.selectChAd();
		model.addAttribute("adChList", adChList);
		model.addAttribute("categoryCode", categoryCode);
		return "channel/ch_categoryresult";
	}

//	개인 채널 보기
	@RequestMapping(value = "/ch_personal_main")
	public String chPersonalMain(String chId, Model model, HttpSession session) {
		ChannelVO channel = service.chRead(chId);
		ArrayList<ProductVO> prodListResult = service.getProdList(chId);

		// 팔로잉 유무
		String fUser = service.fCheck(chId, session);

		model.addAttribute("prodListResult", prodListResult);
		model.addAttribute("channel", channel);
		model.addAttribute("fUser", fUser);
		return "channel/ch_personal_main";
	}

//	개인 채널 수정 폼으로 가기
	@RequestMapping(value = "/ch_management")
	public String chManagement(String chId, Model model) {
		ChannelVO channel = service.chRead(chId);
		ArrayList<ProductVO> prodListResult = service.getProdList(chId);
		model.addAttribute("prodListResult", prodListResult);
		model.addAttribute("channel", channel);
		return "channel/ch_management";
	}

//	개인 채널 수정
	@RequestMapping(value = "/chModify")
	public String chModify(ChannelVO vo, HttpSession session, MultipartFile[] upload, HttpServletRequest request) {

		String saveDir = "C:\\Users\\MeoJong\\Desktop\\Project\\ekuru\\src\\main\\webapp\\resources\\upload\\file";

		System.out.println(upload[0].getOriginalFilename());

		//위에서 설정한 경로의 폴더가 없을 경우 생성
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		String reName = "person1.png";
		// 파일 업로드
		for(MultipartFile f : upload) {
			if(!f.isEmpty()) {
				// 기존 파일 이름을 받고 확장자 저장
				String orifileName = f.getOriginalFilename();
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				// 이름 값 변경을 위한 설정
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
				int rand = (int)(Math.random()*1000);

				// 파일 이름 변경
				reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;


				// 파일 저장
				try {
					f.transferTo(new File(saveDir + "/" + reName));
				}catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					}
				}
			}
		vo.setChProfile(reName);
		//System.out.println(vo);
		service.chModify(vo);
		return "redirect:/channel/ch_personal_main?chId="+vo.getChId();
	}


//	상품 삭제
	@ResponseBody
	@RequestMapping(value = "/prodDelete")
	public HashMap<String, Object> prodDelete(@RequestBody HashMap<String, Object> json) {
		return service.prodDelete(json);
	}

//	채널 게시글 폼
	@RequestMapping(value = "/ch_posters")
	public String chPosters(String chId, Model model) {
		ChannelVO channel = service.chRead(chId);
		model.addAttribute("channel", channel);
		return "channel/ch_posters";
	}

	// 채널 게시글 쓰기
	@RequestMapping(value = "/ch_posters_Write", method = RequestMethod.POST)
	public String ch_posters_Write(ProductVO vo, HttpSession session, MultipartFile[] upload, HttpServletRequest request) {

		//파일이 업로드 될 경로 설정
		String saveDir = "C:\\Users\\MeoJong\\Desktop\\Project\\ekuru\\src\\main\\webapp\\resources\\upload\\file";

		//System.out.println(upload[0].getOriginalFilename());
		//위에서 설정한 경로의 폴더가 없을 경우 생성
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}

		int count = 0;
		String reName = "Test-image.png";
		String[] nm = {"Test-image.png", "Test-image.png", "Test-image.png"};
		// 파일 업로드
		for(int i = 0; i < upload.length; i++) {

			if(upload[i].isEmpty()) {
				continue;
			}

			else {
				MultipartFile f = upload[i];
				if(!f.isEmpty()) {
					// 기존 파일 이름을 받고 확장자 저장
					String orifileName = f.getOriginalFilename();
					String ext = orifileName.substring(orifileName.lastIndexOf("."));
					// 이름 값 변경을 위한 설정
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
					int rand = (int)(Math.random()*1000);

					// 파일 이름 변경
					reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;


					// 파일 저장
					try {
						f.transferTo(new File(saveDir + "/" + reName));
					}catch (IllegalStateException | IOException e) {
						e.printStackTrace();
						}
					}
				nm[i] = reName;
			}
		}

		vo.setProdOriginalPic1(nm[0]);
		vo.setProdOriginalPic2(nm[1]);
		vo.setProdOriginalPic3(nm[2]);

		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);

		service.ch_posters_Write(vo);
		return "redirect:/channel/ch_personal_main?chId=" + vo.getUserId();
	}

//	채널 게시글 수정 폼
	@RequestMapping(value = "/ch_contentModify")
	public String ch_contentModify(ProductVO prodVo,Model model) {
		ProductVO prodResult = service.getProdEach(prodVo);
		ArrayList<ProductCommentVO> commentResult = service.getProdComment(prodVo.getProdNum());
		service.getCategory(prodVo,model);
		model.addAttribute("prodResult", prodResult);
		model.addAttribute("commentResult", commentResult);
		return "channel/ch_contentModify";

	}

//	채널 게시글 수정
	@RequestMapping(value = "/contentModify")
	public String contentModify(ProductVO vo) {
		service.contentModify(vo);
		return "redirect:/channel/ch_management?chId="+vo.getUserId();
	}


//	채널 게시글 보기 (구매자)
	@RequestMapping(value = "/ch_content")
	public String chContent(String chId, ProductVO prodVo, Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException {
		ChannelVO channel = service.chRead(chId);
		ProductVO prodEachResult = service.getProdEach(prodVo);
		ArrayList<ProductCommentVO> commentResult = service.getProdComment(prodVo.getProdNum());
		String userId = (String) session.getAttribute("userId");
		boolean result = false;

		if (userId != null) {
			for (ProductCommentVO productCommentVO : commentResult) {
				if (productCommentVO.getUserId().equals(userId)) {
					result = true;
					break;
				}
			}
		}

		//현재 시간을 가져옴
		//SimpleDateFormat sysdate = new SimpleDateFormat ( "MM-DD HH:mm");
		//Date time = new Date();
		//String time1 = sysdate.format(time);


		String prod = Integer.toString(prodVo.getProdNum());
		Cookie cook = new Cookie("prodnum" + prod, URLEncoder.encode(prod, "UTF-8"));
		cook.setMaxAge(300);
		cook.setPath("/user");

		System.out.println(cook.getValue());
		System.out.println(cook.getName());

		response.addCookie(cook);
		//System.out.println(cook.getValue());

		model.addAttribute("channel", channel);
		model.addAttribute("prodEachResult", prodEachResult);

		model.addAttribute("commentResult", commentResult);
		model.addAttribute("result", result);

		return "channel/ch_content";
	}




//	채널 댓글 달기
	@ResponseBody
	@RequestMapping(value = "addComment")
	public HashMap<String, Object> addComment(@RequestBody HashMap<String, Object> json) {
		return service.addComment(json);
	}

//	채널 댓글 쓰기
	@ResponseBody
	@RequestMapping(value = "deleteComment")
	public boolean deleteCommeent(@RequestBody HashMap<String, Object> json){
		return service.deleteComment(json);
	}

//	채널 생성
	@RequestMapping(value = "/chCreate")
	public String chCreate(HttpSession session) {
		String id = (String) session.getAttribute("userId");

		service.chCreate(id);

		return "redirect:/channel/ch_personal_main?chId="+id;

	}

//	채널 팔로우
	@RequestMapping(value = "/chFollow")
	public String chFollow(String chId, FollowingVO fVo, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		fVo.setUserId(userId);
		service.chFollow(fVo);


		return "redirect:/channel/ch_personal_main?chId="+chId;

	}

//	팔로잉한 채널 보기
	@RequestMapping(value = "/channel_following")
	public String channelFollowing(HttpSession session, Model model) {
		service.channelFollowing(session, model);

		return "user/mypage_followingList";

	}

//	팔로잉 채널 삭제
	@RequestMapping(value = "/deleteFollowingList")
	public String deleteFollowingList(HttpSession session) {
		service.deleteFollowingList(session);
		return "user/mypage_followingList";

	}


}
