package com.scit.ekuru.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;

import com.scit.ekuru.service.ChannelService;
import com.scit.ekuru.service.RequestService;
import com.scit.ekuru.service.UserService;
import com.scit.ekuru.vo.RequestCommentVO;
import com.scit.ekuru.vo.RequestVO;
import com.scit.ekuru.vo.UserVO;

@Controller
@RequestMapping(value="/request")
public class RequestViewController {

	private static final Logger logger = LoggerFactory.getLogger(RequestViewController.class);

	@Autowired
	private RequestService service;

	@Autowired
	private UserService userService;

	@Autowired
	private ChannelService chService;

	@Autowired
	private HttpSession session;

	//request 메인화면으로 가기
	@RequestMapping(value="/request_main", method=RequestMethod.GET)
	public String requestMain(Model model, @RequestParam(defaultValue="")String search) {
		logger.info("Move to request main");
		String id = (String)session.getAttribute("userId");
		UserVO user = userService.selectUserTest(id);

		ArrayList<RequestVO> requestList = service.selectRequestAll(search);
		ArrayList<RequestVO> adReqList = service.selectReqAd();

		model.addAttribute("requestList", requestList);
		model.addAttribute("adReqList", adReqList);
		model.addAttribute("user", user);
		return "request/request_main";
	}


	//request 쓰기폼으로 이동
	@RequestMapping(value="/request_writeForm", method=RequestMethod.GET)
	public String requestWriteForm() {
		logger.info("Move to request writeForm");
		return "request/request_writeForm";
	}

	//request 쓰기실행
	@RequestMapping(value="/request_write", method=RequestMethod.POST)
	public String requestWrite(RequestVO reqVO, HttpSession session, MultipartFile[] upload, HttpServletRequest request) {

		//String saveDir = "C:\\Users\\SCIT\\Documents\\E-kuru_github\\ekuru\\src\\main\\webapp\\resources\\upload\\file";
		String saveDir = "C:\\Users\\MeoJong\\Desktop\\Project\\ekuru\\src\\main\\webapp\\resources\\upload\\file";



		System.out.println(upload[0].getOriginalFilename());

		//위에서 설정한 경로의 폴더가 없을 경우 생성
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}

		String reName = "";
		String[] nm = {"Test-image.png", "Test-image.png", "Test-image.png"};

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
		reqVO.setReqOriginalPic1(nm[0]);
		reqVO.setReqOriginalPic2(nm[1]);
		reqVO.setReqOriginalPic3(nm[2]);
		//System.out.println(vo);

		return service.insertOne(reqVO);
	}

	//rewrite 폼으로 이동
	@RequestMapping(value="/request_rewriteForm", method=RequestMethod.GET)
	public String requestRewirteForm(int reqNum, Model model) {
		//세션에서 로그인한 아이디 읽기
		String id = (String) session.getAttribute("userId");
		//전달된 글 번호로 수정할 글 읽기
		RequestVO vo = service.selectReqOne(reqNum);

		//본인 글이 아니면 메인화면으로 이동
		if(!id.equals(vo.getUserId())) {
			return "redirect:/request/request_readForm?reqNum="+reqNum;
		}

		model.addAttribute("vo", vo);
		return "request/request_rewriteForm";
	}

	//rewrite 업데이트 실행
	@RequestMapping(value="/request_update", method=RequestMethod.POST)
	public String updateRequest(RequestVO reqVO, HttpSession session, MultipartFile[] upload, HttpServletRequest request) {

		//String saveDir = "C:\\Users\\SCIT\\Documents\\E-kuru_github\\ekuru\\src\\main\\webapp\\resources\\upload\\file";
		String saveDir = "C:\\Users\\MeoJong\\Desktop\\Project\\ekuru\\src\\main\\webapp\\resources\\upload\\file";
		System.out.println(upload[0].getOriginalFilename());

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
		reqVO.setReqOriginalPic1(nm[0]);
		reqVO.setReqOriginalPic2(nm[1]);
		reqVO.setReqOriginalPic3(nm[2]);
		String path = service.updateRequest(reqVO);
		return path;
	}

	//request 읽기폼으로 이동
	@RequestMapping(value="/request_readForm", method=RequestMethod.GET)
	public String requestReadForm(int reqNum, Model model) {
		logger.info("Move to request readForm");
		//읽기 폼 내용 불러오기
		RequestVO vo = service.selectReqOne(reqNum);
		//코멘트 불러오기
		ArrayList<RequestCommentVO> comment = service.selectComment(reqNum);
		System.out.println(vo);

		model.addAttribute("vo", vo);
		model.addAttribute("comment", comment);

		return "request/request_readForm";
	}

	// 내 요청글 지우기
	@RequestMapping(value="/request_deleteRequest")
	public String deleteRequest(int reqNum) {
		logger.info("{} 번 글 삭제하기", reqNum);

		return service.deleteRequest(reqNum);
	}

	//request 카테고리 결과로 이동
	@RequestMapping(value="/request_categoryResult", method=RequestMethod.GET)
	public String requestCategoryResult(int categoryCode, Model model) {
		logger.info("Move to request category result"+ categoryCode);
		String id = (String)session.getAttribute("userId");

		ArrayList<RequestVO> list = service.requestCategoryResult(categoryCode);
		ArrayList<RequestVO> adReqList = service.selectReqAd();
		UserVO user = userService.selectUserTest(id);

		model.addAttribute("categoryCode", categoryCode);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
		model.addAttribute("adReqList", adReqList);

		return "request/request_categoryResult";
	}

	//request 카테고리 결과로 이동
	@RequestMapping(value="/request_search", method=RequestMethod.GET)
	public String requestSearchResult() {
		logger.info("Move to request search result");

		return "request/request_search";
	}

	//request에 댓글 달기
	@RequestMapping(value="/request_comment", method=RequestMethod.POST)
	public String requestComment(RequestCommentVO comment, int reqNum) {
		logger.info("코멘트 달기");
		comment.setReqCommentNum(reqNum);

		return service.insertComment(comment, reqNum);
	}

	//request 댓글 지우기
	@RequestMapping(value="/request_deleteComment", method=RequestMethod.GET)
	public String deleteComment(int reqCommentNum) {
		RequestCommentVO vo = service.getReqNum(reqCommentNum);
		int reqNum = vo.getReqNum();

		int cnt = service.deleteComment(reqCommentNum);

		String path =" ";

		if(cnt>0) {
			logger.info("코멘트 지우기 성공");
			path ="redirect:/request/request_readForm?reqNum="+reqNum;
		}else {
			logger.info("코멘트 지우기 실패");
			path ="redirect:/request/request_readForm?reqNum="+reqNum;
		}

		return path;
	}

	//검색결과
	@RequestMapping(value="/request_search", method = RequestMethod.POST)
	public String search(@RequestParam(defaultValue="")String search, Model model) {
		logger.info("검색어 : {}", search);
		logger.info("내용 검색 후, 목록 출력");

		ArrayList<RequestVO> adReqList = service.selectReqAd();
		ArrayList<RequestVO> searchList = service.selectRequestAll(search);

		model.addAttribute("searchList", searchList);
		model.addAttribute("adReqList", adReqList);
		return "request/request_search";
	}

	//내 요청글 history 가기
	@RequestMapping(value="/request_manageRequest", method=RequestMethod.GET)
	public String requestHistory(Model model) {
		logger.info("요청글 히스토리 열기");
		String id = (String)session.getAttribute("userId");
		ArrayList<RequestVO> list = service.mypageReq(id);

		model.addAttribute("list", list);
		return "/user/mypage_manageRequest";
	}

	@RequestMapping(value="/request_manageDelete", method=RequestMethod.GET)
	public String deleteHistory() {
		logger.info("요청글 히스토리 열기");
		String id = (String)session.getAttribute("userId");

		String path = service.deleteMypageReq(id);

		return path;
	}

}
