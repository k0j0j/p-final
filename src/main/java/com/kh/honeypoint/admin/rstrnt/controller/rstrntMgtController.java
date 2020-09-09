package com.kh.honeypoint.admin.rstrnt.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Pagination;
import com.kh.honeypoint.admin.member.controller.memberMgtController;
import com.kh.honeypoint.admin.member.model.exception.MemberException;
import com.kh.honeypoint.admin.rstrnt.model.service.RstrntMgtService;
import com.kh.honeypoint.admin.rstrnt.model.vo.RstrntMgt;

@Controller
public class rstrntMgtController {
	@Autowired
	private RstrntMgtService rstMService;
	
	private Logger logger = LoggerFactory.getLogger(memberMgtController.class);

	/* RSTRNT-ALL */
	@RequestMapping("rSearch.do")
	public ModelAndView rstrntAll(ModelAndView mv, 
				  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
	   
		int currentPage = page != null ? page : 1;

		int listCount = rstMService.rstrntAllCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<RstrntMgt> list = rstMService.rstrntAll(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/admin/rstrnt/rstrnt_Mgt");
		} else {
			throw new MemberException("맛집 목록 조회에 실패했습니다.");
		}		
		return mv;
	}
 
	/* RSTRNT-DELETE */
	@RequestMapping("deleteRstMgt.do")
	public String deleteRstMgt(int rNo) {	
		
		int result = rstMService.deleteRstMgt(rNo);

		if(result > 0) {
			return "redirect:rSearch.do";
		} else {
			return "admin/rstrnt/model/exceptiont/rstrntMgtException"; 
		}
	}
	
	
	
	
	/* RSTRNT-REGIST*/
	@RequestMapping("rstRegist.do")
	public ModelAndView rstrntRegist(ModelAndView mv, 
				  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
	   
		int currentPage = page != null ? page : 1;

		int listCount = rstMService.rstrntRegistCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<RstrntMgt> list = rstMService.rstrntRegist(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/admin/rstrnt/rstMgtRegist");
		} else {
			throw new MemberException("맛집 신청 목록 조회에 실패했습니다.");
		}		
		return mv;
	}

	/* RSTRNT-INSERT */
	@RequestMapping("insertRstMgt.do")
	public String insertRstMgt(int rNo) {	
		
		int result = rstMService.insertRstMgt(rNo);

		if(result > 0) {
			return "redirect:rstRegist.do";
		} else {
			return "admin/rstrnt/model/exceptiont/rstrntMgtException"; 
		}
	}	
	
	/* RSTRNT-REJECT/DELETE */
	@RequestMapping("jestctRstMgt.do")
	public String jestctRstMgt(int rNo) {	
		
		int result = rstMService.jestctRstMgt(rNo);

		if(result > 0) {
			return "redirect:rstRegist.do";
		} else {
			return "admin/rstrnt/model/exceptiont/rstrntMgtException"; 
		}
	}	
	
	/* RSTRNT-REJECT*/
	@RequestMapping("rntReject.do")
	public ModelAndView rstrntReject(ModelAndView mv, 
				  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
	   
		int currentPage = page != null ? page : 1;

		int listCount = rstMService.rstrntRejectCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<RstrntMgt> list = rstMService.rstrntReject(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/admin/rstrnt/rstMgtReject");
		} else {
			throw new MemberException("반려 처리된 목록 조회에 실패했습니다.");
		}		
		return mv;
	}
	



}
