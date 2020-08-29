package com.kh.honeypoint.mypage.member.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class memberMyPageController {

	@RequestMapping("rstrntmp.do")
	public String RstrntMyPage() {
		return "mypage/rstrntMyPage";
	}
	
}
