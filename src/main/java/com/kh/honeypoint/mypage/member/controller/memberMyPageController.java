package com.kh.honeypoint.mypage.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberMyPageController {
	@RequestMapping("membermp.do")
	public String rstrntMyPage() {
		return "mypage/rstrntMyPage";
	}
	
}
