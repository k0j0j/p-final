package com.kh.honeypoint.search.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.honeypoint.search.model.service.SearchRestaurantService;
import com.kh.honeypoint.search.model.vo.PageInfo;
import com.kh.honeypoint.search.model.vo.Pagination;
import com.kh.honeypoint.search.model.vo.Search;
import com.kh.honeypoint.search.model.vo.Restaurant;



@Controller
public class SearchController {
	@Autowired
	private SearchRestaurantService sService;
	

	
	// 검색
	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public String noticeSearch(Search search, Model model, @RequestParam(value = "page", required = false) Integer page
			){

		
		int listCount = sService.selectListCount(search);
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Restaurant>searchList = sService.searchList(search, pi);
		
		// 키워드 
		
		System.out.println(search);
//		System.out.println(searchList);
//		
//		System.out.println(pi);
//		
//		System.out.println(listCount);
		
		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		model.addAttribute("listCount", listCount);
		model.addAttribute("pi", pi);
		
		// 전체 게시글 개수 리턴 받기
		
		return "search/searchList";

	}
	@RequestMapping("searchscroll.do")
	@ResponseBody
	public ArrayList<Restaurant> ajaxMethod(Search search, @RequestParam(value = "page", required = false) Integer page)
			 {
		System.out.println(search);
		System.out.println(page);
				
		int listCount = sService.selectListCount(search);
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Restaurant>searchList = sService.searchList(search, pi);
		

		
		System.out.println("ㄴㅁㅇㄹㄹㄴㅇㅁㄹㅇㄴㅁ" + searchList);
		
		return searchList;
		
	}
	
	
}
