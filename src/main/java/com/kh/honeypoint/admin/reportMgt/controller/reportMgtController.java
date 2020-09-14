package com.kh.honeypoint.admin.reportMgt.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Pagination;
import com.kh.honeypoint.admin.common.SPagination;
import com.kh.honeypoint.admin.common.SearchPaging;
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
		
		SearchPaging sp = new SearchPaging(pi.getCurrentPage(), pi.getListCount(),pi.getPageLimit() , pi.getMaxPage(), pi.getStartPage(), pi.getEndPage(), pi.getBoardLimit());
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/report/mgt_Report");
		} else {
			throw new MemberException("신고 목록 조회에 실패했습니다.");
		}		
		return mv;
	}
	
	/* REPORT DELETE - 전체 */
	@RequestMapping("mgtReportDel.do")
	public String mgtReportDel(int targetNo) {	
		
		int result = rMgtService.mgtReportDel(targetNo);

		if(result > 0) {			
			return "redirect:reportList.do";
		} else {			
			return "admin/reportMgt/model/exception/ReportMgtException"; 
		}
	}
	
	/* REPORT DELETE - 전체 처리 보류 */
	@RequestMapping("mgtReportReturn.do")
	public String mgtReportReturn(int prtNo) {	
		
		int result = rMgtService.mgtReportReturn(prtNo);
		
		if(result > 0) {			
			return "redirect:reportList.do";
		} else {			
			return "admin/reportMgt/model/exception/ReportMgtException"; 
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	/* REPORT DELETE - 회원 신고 목록 */
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
	
	/* REPORT 보류  - 회원 처리 보류 */
	@RequestMapping("mgtReportReturn2.do")
	public String mgtReportReturn2(int prtNo) {	
		
		int result = rMgtService.mgtReportReturn2(prtNo);
		
		if(result > 0) {			
			return "redirect:memReport.do";
		} else {			
			return "admin/reportMgt/model/exception/ReportMgtException"; 
		}
	}
	
	/* REPORT DELETE - 회원 */
	@RequestMapping("mgtMemReportDel.do")
	public String deleteMemReportMgt(int targetNo) {	
		
		int result = rMgtService.deleteMemReportMgt(targetNo);

		if(result > 0) {			
			return "redirect:memReport.do";
		} else {			
			return "admin/reportMgt/model/exception/ReportMgtException"; 
		}
	}
	
	
	
	
	
	
	
	
	
	/* REPORT DELETE - 맛집 */
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
	
	/* REPORT DELETE - 회원 처리 보류 */
	@RequestMapping("mgtReportReturn3.do")
	public String mgtReportReturn3(int prtNo) {	
		
		int result = rMgtService.mgtReportReturn3(prtNo);
		
		if(result > 0) {			
			return "redirect:rntReport.do";
		} else {			
			return "admin/reportMgt/model/exception/ReportMgtException"; 
		}
	}
	
	/* REPORT DELETE - 맛집 */
	@RequestMapping("mgtRstReportDel.do")
	public String deleteRstReportMgt(int targetNo) {	
		
		int result = rMgtService.deleteRstReportMgt(targetNo);

		if(result > 0) {			
			return "redirect:rntReport.do";
		} else {			
			return "admin/reportMgt/model/exception/ReportMgtException"; 
		}
	}
	
	
	
	
	
	
	
	
	
	/* REPORT SEARCH */
	@RequestMapping("resportKeySearch.do")	
	public ModelAndView resportKeySearch(ModelAndView mv,
								  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page,
								  @ModelAttribute SearchPaging sp ) {
		
		System.out.println("value= " + sp.getSearchValue());

		String a = sp.getSearchValue();
		logger.info(a);
		
		int listCount = rMgtService.resportKeySearchCount(sp);
		int currentPage = page != null ? page : 1;		
		System.out.println("CRTL: " + listCount);

		sp = SPagination.getPageInfo(currentPage, listCount);
		
		sp.setSearchValue(a);
		logger.info("a2= " + a);
		
		ArrayList<Report> list = rMgtService.resportKeySearch(sp);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/report/mgt_Report");
		} else {
			throw new MemberException("회원 검색에 실패했습니다.");
		}		
		return mv;
	}
	
}
