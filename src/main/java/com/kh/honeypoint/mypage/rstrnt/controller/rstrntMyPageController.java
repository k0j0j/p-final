package com.kh.honeypoint.mypage.rstrnt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class rstrntMyPageController {
	@RequestMapping("rstrntmp.do")
	public String rstrntMyPage() {
		return "mypage/rstrntMyPage";
	}
	
}
