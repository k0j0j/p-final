package com.kh.honeypoint.admin.reportMgt.controller;

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
import com.kh.honeypoint.admin.reportMgt.model.service.ReportMgtService;
import com.kh.honeypoint.admin.reportMgt.model.vo.Report;

@Controller
public class reportMgtController {
	@Autowired
	private ReportMgtService rMgtService;
	
	private Logger logger = LoggerFactory.getLogger(memberMgtController.class);	
	
	@RequestMapping("reportList.do")
	public ModelAndView Mgt_Report(ModelAndView mv, 
			  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		int listCount = rMgtService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Report> list = rMgtService.selectReportList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/admin/report/mgt_Report");
		} else {
			throw new MemberException("신고 목록 조회에 실패했습니다.");
		}		
		return mv;
	}

	@RequestMapping("memReport.do")
	public ModelAndView membMgt_Report(ModelAndView mv, 
			  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		int listCount = rMgtService.selectReportMemListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Report> list = rMgtService.selectReportMemList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/admin/report/member_Report");
		} else {
			throw new MemberException("신고 목록 조회에 실패했습니다.");
		}		
		return mv;
	}	
	
	@RequestMapping("rntReport.do")
	public ModelAndView rntbMgt_Report(ModelAndView mv, 
			  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		int listCount = rMgtService.selectReportRstListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Report> list = rMgtService.selectReportRstList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/admin/report/rstrnt_Report");
		} else {
			throw new MemberException("신고 목록 조회에 실패했습니다.");
		}		
		return mv;
	}
	
	/* REPORT DELETE */
	@RequestMapping("mgtReportDel.do")
	public String deleteReportMgt(int targetNo) {	
		
		int result = rMgtService.deleteReportMgt(targetNo);

		if(result > 0) {			
			return "redirect:reportList.do";
		} else {			
			return "admin/reportMgt/model/exception/ReportMgtException"; 
		}
	}
	
	/* REPORT DELETE */
	@RequestMapping("mgtMemReportDel.do")
	public String deleteMemReportMgt(int targetNo) {	
		
		int result = rMgtService.deleteMemReportMgt(targetNo);

		if(result > 0) {			
			return "redirect:memReport.do";
		} else {			
			return "admin/reportMgt/model/exception/ReportMgtException"; 
		}
	}
	
	/* REPORT DELETE */
	@RequestMapping("mgtRstReportDel.do")
	public String deleteRstReportMgt(int targetNo) {	
		
		int result = rMgtService.deleteRstReportMgt(targetNo);

		if(result > 0) {			
			return "redirect:rntReport.do";
		} else {			
			return "admin/reportMgt/model/exception/ReportMgtException"; 
		}
	}
}
