package com.scit.ekuru.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.ekuru.service.UserService;
import com.scit.ekuru.vo.PointProductVO;
import com.scit.ekuru.vo.PointVO;
import com.scit.ekuru.vo.UserVO;

@Controller
@RequestMapping(value="/payment")
public class PaymentController {
   
   private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
   
   @Autowired
   private UserService service;
   
   @Autowired
   private HttpSession session;
   
   @RequestMapping(value="/payment", method=RequestMethod.GET)
   public String payment(int pointProdNum,Model model) {
      logger.info("Open paypal payment");
      PointProductVO pvo = service.selectPointPricing(pointProdNum);
      String id = (String)session.getAttribute("userId");
      UserVO vo = service.selectUserTest(id);
      
      model.addAttribute("pvo", pvo);
      model.addAttribute("vo", vo);
      return "/payment";
   }
   
   @RequestMapping(value="/payinsert", method=RequestMethod.GET)
   public String payInsert(int pointProdNum,Model model) {
      logger.info("결제 성공! 포인트로 전환");
      String id = (String)session.getAttribute("userId");
      PointVO point = new PointVO();
      point.setPointProdNum(pointProdNum);
      point.setUserId(id);
      
      String path = service.insertPoint(point);
      logger.info("포인트로 전환");
      UserVO vo = service.selectUserTest(id);
      PointProductVO pvo = service.selectPointPricing(pointProdNum);
      int total = vo.getUserPoint()+pvo.getPointProdName();
      
      UserVO updateVo = new UserVO();
      updateVo.setUserId(id);
      updateVo.setUserPoint(total);
      
      int cnt = service.updateUserPoint(updateVo);
      
      if(cnt>0) {
         logger.info("충전 업데이트 성공");
      }else {
         logger.info("충전 업데이트 실패");
      }
      //세션에 포인트내용 업데이트
      UserVO newVo = service.selectUserTest(id);
      session.setAttribute("userPoint", newVo.getUserPoint());
      
      return path;
   }
   
   

}