package com.kh.honeypoint.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.honeypoint.member.model.vo.Member;

// 공지사항, 게시판을 메뉴바에서 클릭했을 때 로그인 되어 있지 않으면
// 요청을 수용하지 않는 인터셉터의 기능 구현하기

// 1. servlet-context.xml에 interceptor 등록
// 2. logger 등록 후 logger 객체 필드로 설정
// 3. 요청 전에 로그인 여부를 확인할 수 있는 전처리 메소드를 오버라이딩하여 구현함
public class LoginInterceptor extends HandlerInterceptorAdapter{
	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		System.out.println("프리핸드들어감 : " + loginUser.getmNo());
		
		if(loginUser == null) {
			logger.info("비 로그인 상태에서 [" + request.getRequestURI() + "] 접근하려고 함!");
			String uri = request.getRequestURI();
			String query = request.getQueryString();
			if(StringUtils.isNotEmpty(query))
				uri += "?" + query;
			
			session.setAttribute("attempt", uri);
			session.setAttribute("msg", "로그인 후 이용하세요");
			response.sendRedirect("home.do");
			return false;	// 컨트롤러로 요청이 전달 되지 않게 false 리턴함
			
		}
		
		return super.preHandle(request, response, handler); // 컨트롤러로 요청이 전달 됨
	}
	
	
	
	
	
	
	
	
	
}
