package com.scit.ekuru.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 사용자 로그인 확인 인터셉터. HandlerInterceptorAdapter를 상속받아서 정의.
 * HandlerInterceptorAdapter는 프론트 컨트롤러와 페이지 컨트롤러를 연결시켜주기위해
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	//servlet-context.xml파일에서 설정한다
	//콘트롤러의 메서드 실행 전에 처리
	//오버라이딩을 했기 때문에 요청에서 Session을 꺼내야한다
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.debug("LoginInterceptor 실행");
		
		//세션의 로그인 정보 읽기
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("userId");
		
		//로그인되지 않은 경우 로그인 페이지로 이동
		if (loginId == null) {
			//request.getContextPath()로 루트 경로를 구하여 절대 경로로 처리
			response.sendRedirect(request.getContextPath() + "/user/loginForm");
			return false;
		}
		//로그인 된 경우 요청한 경로로 진행
		return super.preHandle(request, response, handler);
	}

}
