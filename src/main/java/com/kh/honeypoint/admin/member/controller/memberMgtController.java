package com.kh.honeypoint.admin.member.controller;

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
import com.kh.honeypoint.admin.member.model.exception.MemberException;
import com.kh.honeypoint.admin.member.model.service.MemberService;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;

@Controller
public class memberMgtController {
	@Autowired
	private MemberService mService;
	
	private Logger logger = LoggerFactory.getLogger(memberMgtController.class);
	
	@RequestMapping("memMgt.do")
	public ModelAndView memberList(ModelAndView mv, 
								  @RequestParam(value="page", required=false) Integer page) {
		int currentPage = page != null ? page : 1;
		
		int listCount = mService.selectListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<MemberMgt> list = mService.selectList(pi);
		
		System.out.println("pi: "+ listCount);
		/*TEST*/System.out.println("List: " + list);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/admin/member/member_Mgt");
		} else {
			throw new MemberException("게시글 목록 조회에 실패했습니다.");
		}
		
		/*TEST*/System.out.println("return: " + mv);
		return mv;
	}
	
	@RequestMapping("memReport.do")
	public String rstrntReport() {
		return "admin/member/member_Report";
	}

	
	
	
   
   
   
   
   
   
}
