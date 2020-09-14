package com.kh.honeypoint.admin.Advrts.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.honeypoint.admin.Advrts.model.exception.AdvrtsMgtException;
import com.kh.honeypoint.admin.Advrts.model.service.AdvrtsMgtService;
import com.kh.honeypoint.admin.Advrts.model.vo.AdvrtsMgt;
import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Pagination;
import com.kh.honeypoint.admin.common.SearchPaging;

@Controller
public class advrtsMgtController {
	@Autowired
	private AdvrtsMgtService adMService;
	
	/*  ADVRTS LIST */
	@RequestMapping("advrtsList.do")
	public ModelAndView AdvrtsList(ModelAndView mv, 
			  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;		
		int listCount = adMService.AdvrtsListCount();		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		System.out.println("Page: " + currentPage + ", " + listCount);
		
		ArrayList<AdvrtsMgt> list = adMService.AdvrtsList(pi);
		
		SearchPaging sp = new SearchPaging(pi.getCurrentPage(), pi.getListCount(),pi.getPageLimit() , 
				pi.getMaxPage(), pi.getStartPage(), pi.getEndPage(), pi.getBoardLimit());
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/AdvrtsMgt/advrts_List");
		} else {
			throw new AdvrtsMgtException("광고 목록 조회에 실패했습니다.");
		}		
		return mv;
	}
	
	/* ADVRTS INSERT */
	@RequestMapping("advrtsIn.do")
	public String advrtsIn(int bNo) {	
		
		int result = adMService.advrtsIn(bNo);

		if(result > 0) {
			
			return "redirect:advrtsList.do";
		} else {			
			return "admin/Advrts/model/exceptiont/AdvrtsMgtException"; 
		}
	}
	
	/* ADVRTS DELETE */
	@RequestMapping("advrtsDel.do")
	public String advrtsDel(int bNo) {	
		
		int result = adMService.advrtsDel(bNo);

		if(result > 0) {
			
			return "redirect:advrtsList.do";
		} else {			
			return "admin/Advrts/model/exceptiont/AdvrtsMgtException"; 
		}
	}
	
	
	
	
	
	@RequestMapping("advrtsIList.do")
	public ModelAndView AdvrtsIList(ModelAndView mv, 
				  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
			
			int currentPage = page != null ? page : 1;		
			int listCount = adMService.AdvrtsIListCount();		
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			System.out.println("Page: " + currentPage + ", " + listCount);
			
			ArrayList<AdvrtsMgt> list = adMService.AdvrtsIList(pi);
			
			SearchPaging sp = new SearchPaging(pi.getCurrentPage(), pi.getListCount(),pi.getPageLimit() , 
					pi.getMaxPage(), pi.getStartPage(), pi.getEndPage(), pi.getBoardLimit());
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("sp", sp);
				mv.setViewName("/admin/AdvrtsMgt/advrts_InsertMgt");
			} else {
				throw new AdvrtsMgtException("등록된 광고 조회에 실패했습니다.");
			}		
			return mv; 
	}
	
	/* ADVRTS DELETE */
	@RequestMapping("advrtsOff.do")
	public String advrtsOff(int bNo) {	
		
		int result = adMService.advrtsOff(bNo);

		if(result > 0) {
			
			return "redirect:advrtsIList.do";
		} else {			
			return "admin/Advrts/model/exceptiont/AdvrtsMgtException"; 
		}
	}
	
	
	
	
		
	@RequestMapping("advrtsDList.do")
	public ModelAndView advrtsDList(ModelAndView mv, 
			  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;		
		int listCount = adMService.advrtsDListCount();		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		System.out.println("Page: " + currentPage + ", " + listCount);
		
		ArrayList<AdvrtsMgt> list = adMService.advrtsDList(pi);
		
		SearchPaging sp = new SearchPaging(pi.getCurrentPage(), pi.getListCount(),pi.getPageLimit() , 
				pi.getMaxPage(), pi.getStartPage(), pi.getEndPage(), pi.getBoardLimit());
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/AdvrtsMgt/advrts_DeleteMgt");
		} else {
			throw new AdvrtsMgtException("삭제된 광고 조회에 실패했습니다.");
		}		
		return mv;
	}
}
