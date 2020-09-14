package com.kh.honeypoint.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.honeypoint.member.model.exception.memberException;
import com.kh.honeypoint.member.model.service.memberService;
import com.kh.honeypoint.member.model.vo.Member;
import com.kh.honeypoint.member.model.vo.Restaurant;

@SessionAttributes({ "loginUser", "msg" })
@Controller
public class memberController {

	@Autowired
	private memberService mService;

	private Logger logger = LoggerFactory.getLogger(memberController.class);

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		Member loginUser = mService.loginMember(m);
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			// sessionScope에 해당 객체가 저장 됨
			return "../../index";
		} else {
			throw new memberException("로그인에 실패하였습니다");
		}
	}

	// 로그아웃 컨트롤러
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:main.do";
	}

	@RequestMapping("loginPage.do")
	public String loginPage() {
		return "member/login";
	}

	@RequestMapping("joinPage.do")
	public String joinPage() {
		return "member/join";
	}
	@RequestMapping("resMenu.do")
	public String ResMenu() {
		return "member/ResMenu";
	}

	@RequestMapping("minsert.do")
	public String memberInsert(Member m1,Member m2,Member m3, RedirectAttributes rd, @RequestParam("post") String post,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2, 
			@RequestParam("year") String year,@RequestParam("month") String month,
			@RequestParam("day") String day) {

		m2.setmAddress(post + "," + address1 + "," + address2);
		m2.setmBirthday(year+month+day);

		int result1 = mService.insertMember1(m1);
		int result2 = mService.insertMember2(m2);
		int result3 = mService.insertMember3(m3);

		if (result1 > 0 && result2 > 0 &&  result3 > 0) {
			return "member/mFinish";
		} else {
			throw new memberException("회원가입에 실패하였습니다.");
		}
	}
	
	@RequestMapping("rinsert.do")
	public String resInsert(Restaurant r1, Restaurant r2, Restaurant r3, RedirectAttributes rd, @RequestParam("post") String post,
			@RequestParam("rAddress") String rAddress) {
		
		r2.setrAddress(post + "," + rAddress);

		int result1 = mService.insertRes1(r1);
		int result2 = mService.insertRes2(r2);
		int result3 = mService.insertRes3(r3);

		if (result1 > 0 && result2 > 0 &&  result3 > 0) {
			return "member/rFinish";
		} else {
			throw new memberException("회원가입에 실패하였습니다.");
		}
	}

	@RequestMapping("dupid.do")
	public ModelAndView idDuplicateCheck(String mId, ModelAndView mv) {
		boolean isUsable = mService.checkIdDup(mId) == 0 ? true : false;

		Map map = new HashMap();
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);

		mv.setViewName("jsonView");

		return mv;
	}
	
/*	@RequestMapping("menuIn.do")
	public String menuInsert(Menu menu) {
		int result = mService.insertMenu(menu);
		
		if (result > 0) {
			return "member/rFinish";
		} else {
			throw new memberException("회원가입에 실패하였습니다.");
		}
	}*/

}
