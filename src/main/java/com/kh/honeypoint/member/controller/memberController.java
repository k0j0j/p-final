package com.kh.honeypoint.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.honeypoint.HomeController;


//@SessionAttributes({"loginUser","msg"})
@Controller	// Controller 타입의 어노테이션을 붙여주면 빈 스캐닝을 통해 자동으로 빈으로 등록 된다
public class memberController {
	
	
//	// 아래와 같이 Autowired 타입의 어노테이션을 붙여주면 생성할 필요 없이 변수로 선언만 해도
//	// 빈 스캐닝을 통해 아래의 mService의 이름을 가지고 있는 빈을 찾아서 자동으로 생성해줌
//	@Autowired
//	private memberService mService;
//	
//	// 2_3. 로거 객체
//	private Logger logger = LoggerFactory.getLogger(MemberController.class);
//	
//	// 암호화 처리 후 최종 로그인 메소드
//		@RequestMapping(value="login.do", method=RequestMethod.POST)
//		public String memberLogin(Member m, Model model) {
//			Member loginUser = mService.loginMember(m);
//			
//			if(loginUser != null) {
//				model.addAttribute("loginUser", loginUser);
//				
//				// 로그인 성공 시 로그 출력
//				if(logger.isDebugEnabled()) {
//					// 해당 logger가 debug 레벨인지 확인(LogginEvent로 발생 되는 시간 절약)한 뒤
//					logger.info(loginUser.getmId() + " 로그인");
//				}
//			}else {
//				throw new memberException("로그인에 실패하였습니다.");
//			}
//			return "redirect:main.do";
//		}
	@RequestMapping("loginPage.do")
	public String loginPage() {
		return "member/login";
	}
	
	@RequestMapping("joinPage.do")
	public String joinPage() {
		return "member/join";
	}
		
}
