package com.kh.honeypoint.admin.member.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Pagination;
import com.kh.honeypoint.admin.manager.model.vo.Manager;
import com.kh.honeypoint.admin.member.model.exception.MemberException;
import com.kh.honeypoint.admin.member.model.service.MemberService;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;
import com.kh.honeypoint.admin.member.model.vo.Search;

@Controller
public class memberMgtController {
	@Autowired
	private MemberService mService;
	
	private Logger logger = LoggerFactory.getLogger(memberMgtController.class);
	
	@RequestMapping("memMgt.do")
	public ModelAndView memberList(ModelAndView mv, 
								  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;
		/* TEST System.out.println("currentPage: " + currentPage);*/
		
		int listCount = mService.selectListCount();
		/* TEST System.out.println("listCount: " + listCount);*/
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<MemberMgt> list = mService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/admin/member/member_Mgt");
		} else {
			throw new MemberException("회원 목록 조회에 실패했습니다.");
		}		
		return mv;
	}
	
	@RequestMapping("xMemMgt.do")
	public ModelAndView xmemberList(ModelAndView mv, 
								  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;
		/*System.out.println("currentPage: " + currentPage);*/
		
		int listCount = mService.memberSecsnListCount();
		 /*TEST System.out.println("listCount: " + listCount);*/
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<MemberMgt> list = mService.memberSecsnList(pi);		
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/admin/member/member_Secsn");
		} else {
			throw new MemberException("탈퇴 회원 목록 조회에 실패했습니다.");
		}
		
		System.out.println("return 2: " + mv);

		return mv;
	}	
	
	/* MEMBER DELETE */
	@RequestMapping("mgtMdelete.do")
	public String deleteMemberMgt(int mNo) {	
		
		int result = mService.deleteMemberMgt(mNo);

		if(result > 0) {
			
			return "redirect:memMgt.do";
		} else {			
			return "admin/member/model/exceptiont/MemberException"; 
		}
	}
	
	/* MEMBER SEARCH */
	@RequestMapping("memKeySearch.do")
	public String noticeSearch(Search search, Model model) {
		System.out.println("Condition: " + search.getSearchCondition());
		System.out.println("Value: " + search.getSearchValue());

		ArrayList<MemberMgt> searchList = mService.memKeySearch(search);

		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		
		return "/admin/member/member_Mgt";
	}
	
   
	
	
	
	
	
	
	
	

	@RequestMapping("deleteMgt.do")
	public String deleteMgt(int mngNo) {
		System.out.println("Ctrl 1: " + mngNo);
		int result = mService.deleteMgt(mngNo);
		System.out.println("Ctrl 2: " + mngNo);
		if(result>0) {
			return "redirect:managerList.do";
		}else {
			return "admin/manager/model/exception/ManagerException";
		}
	}
}
