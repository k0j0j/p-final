package com.kh.honeypoint.admin.Inqry.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.honeypoint.admin.Inqry.model.service.InqryMgtService;
import com.kh.honeypoint.admin.Inqry.model.vo.InqryMgt;
import com.kh.honeypoint.admin.Inqry.model.exception.InqryMgtException;
import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Pagination;
import com.kh.honeypoint.admin.common.SPagination;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.member.model.exception.MemberException;
import com.kh.honeypoint.admin.reportMgt.model.vo.Report;

@Controller
public class InqryMgtController {
	@Autowired
	private InqryMgtService inqMService;
	
	private Logger logger = LoggerFactory.getLogger(InqryMgtController.class);
	
	/* INQURY LIST */
	@RequestMapping("InqryMgtList.do")
		public ModelAndView InqryMgtList(ModelAndView mv, 
				  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		int listCount = inqMService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<InqryMgt> list = inqMService.InqryMgtList(pi);
		
		SearchPaging sp = new SearchPaging(pi.getCurrentPage(), pi.getListCount(),pi.getPageLimit() , pi.getMaxPage(), pi.getStartPage(), pi.getEndPage(), pi.getBoardLimit());
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/inqryMgt/inqryMgt");
		} else {
			throw new InqryMgtException("문의 목록 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	
	
	
	
	/* MEMBER LIST */
	@RequestMapping("InqryMgtM.do")
		public ModelAndView InqryMgtM(ModelAndView mv, 
				  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		int listCount = inqMService.InqryMgtMCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<InqryMgt> list = inqMService.InqryMgtM(pi);
		
		SearchPaging sp = new SearchPaging(pi.getCurrentPage(), pi.getListCount(),pi.getPageLimit() , pi.getMaxPage(), pi.getStartPage(), pi.getEndPage(), pi.getBoardLimit());
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/inqryMgt/InqryMgtM");
		} else {
			throw new InqryMgtException("회원 문의 목록 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	
	
	
	
	/* RSTRNT LIST */
	@RequestMapping("InqryMgtR.do")
		public ModelAndView InqryMgtR(ModelAndView mv, 
				  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		int listCount = inqMService.InqryMgtRCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<InqryMgt> list = inqMService.InqryMgtR(pi);
		
		SearchPaging sp = new SearchPaging(pi.getCurrentPage(), pi.getListCount(),pi.getPageLimit() , pi.getMaxPage(), pi.getStartPage(), pi.getEndPage(), pi.getBoardLimit());
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/inqryMgt/InqryMgtR");
		} else {
			throw new InqryMgtException("맛집 문의 목록 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	
	
	
	
	/* INQRY SEARCH */
	@RequestMapping("InqryMgtListSearch.do")	
	public ModelAndView InqryMgtListSearch(ModelAndView mv,
								  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page,
								  @ModelAttribute SearchPaging sp ) {
		
		System.out.println("value= " + sp.getSearchValue());

		String a = sp.getSearchValue();
		logger.info(a);
		
		int listCount = inqMService.InqryMgtListSearchCount(sp);
		int currentPage = page != null ? page : 1;		
		System.out.println("CRTL: " + listCount);

		sp = SPagination.getPageInfo(currentPage, listCount);
		
		sp.setSearchValue(a);
		logger.info("a2= " + a);
		
		ArrayList<InqryMgt> list = inqMService.InqryMgtListSearch(sp);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/inqryMgt/inqryMgt");
		} else {
			throw new MemberException("문의 검색에 실패했습니다.");
		}		
		return mv;
	}
}
