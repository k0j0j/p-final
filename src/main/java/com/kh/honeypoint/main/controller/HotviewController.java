package com.kh.honeypoint.main.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.honeypoint.main.model.service.HotviewService;
import com.kh.honeypoint.search.model.vo.Restaurant;



@Controller
public class HotviewController {
	@Autowired
	private HotviewService hotviewService;
	
	// 메인 페이지
	@RequestMapping(value = "main.do")
	public ModelAndView main(ModelAndView mv){

		ArrayList<Restaurant>list = hotviewService.mainList();
		ArrayList<Restaurant>scoreList = hotviewService.main2List();
		ArrayList<Restaurant>cafe = hotviewService.cafeList();

		
		System.out.println(list);

		
		mv.addObject("list", list);
		mv.addObject("scoreList", scoreList);
		mv.addObject("cafe", cafe);
		mv.setViewName("main/main");
		
		return mv;

	}
	

	
	
}
