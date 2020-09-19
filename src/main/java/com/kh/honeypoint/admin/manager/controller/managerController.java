package com.kh.honeypoint.admin.manager.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Pagination;
import com.kh.honeypoint.admin.common.SPagination;
import com.kh.honeypoint.admin.common.Search;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.manager.model.exception.ManagerException;
import com.kh.honeypoint.admin.manager.model.service.ManagerService;
import com.kh.honeypoint.admin.manager.model.vo.Manager;
import com.kh.honeypoint.admin.member.model.exception.MemberException;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;
import com.kh.honeypoint.member.model.vo.Member;

@SessionAttributes({"loginUser", "msg"})
@Controller
public class managerController {
	@Autowired
	private ManagerService mngService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private Logger logger = LoggerFactory.getLogger(managerController.class);
	
	/* MANAGER LIST */
	@RequestMapping("managerList.do")
	public ModelAndView managerList(ModelAndView mv, 
				  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {

		int currentPage = page != null ? page : 1;
		
		int listCount = mngService.selectMngCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Manager> list = mngService.selectMng(pi);

		SearchPaging sp = new SearchPaging(pi.getCurrentPage(), pi.getListCount(),pi.getPageLimit() , pi.getMaxPage(), pi.getStartPage(), pi.getEndPage(), pi.getBoardLimit());
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/manager/manager_List");
		} else {
			throw new ManagerException("관리자 목록 조회에 실패했습니다.");
		}		
			return mv;
	}
	/*	
	@RequestMapping("deleteMgt.do")
	public String deleteMgt(int mngNo) {
		System.out.println("Ctrl 1: " + mngNo);
		int result = mngService.deleteMgt(mngNo);
		System.out.println("Ctrl 2: " + mngNo);
		if(result>0) {
			return "redirect:managerList.do";
		}else {
			return "admin/manager/model/exception/ManagerException";
	}
	 */
	
	/* ID CHECK */
	@RequestMapping("idCheck.do")
	public ModelAndView inDuplicateCheck(String mId, ModelAndView mv) {
		boolean isUsable = mngService.idCheck(mId) == 0 ? true : false;
		
		Map map = new HashMap();
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);

		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("enrollView.do")
	public String enrollView() {
		return "/admin/manager/manager_Signup";
	}
	
	/* mngInsert*/
	@RequestMapping("mngInsert.do")
	public String mngInsert(Manager m, RedirectAttributes rd) {
		int result = mngService.mngInsert(m);
		if(result > 0) {
			rd.addFlashAttribute("msg", "관리자 생성이 완료되었습니다.");
			return "redirect:managerList.do";
		}else {
			throw new ManagerException("관리자 생성에 실패했습니다.");
		}
	}
	
	/* Search */
	@RequestMapping("mngKeySearch.do")	
	public ModelAndView mngKeySearch(ModelAndView mv,
								  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page,
								  @ModelAttribute SearchPaging sp ) {
		
		System.out.println("value= " + sp.getSearchValue());

		String a = sp.getSearchValue();
		String b = sp.getSearchCondition();
		logger.info(a + ", " + b);
		
		int listCount = mngService.mngKeySearchCount(sp);
		int currentPage = page != null ? page : 1;		
		System.out.println("CRTL: " + listCount);

		sp = SPagination.getPageInfo(currentPage, listCount);
		
		sp.setSearchValue(a);
		sp.setSearchCondition(b);
		
		ArrayList<Manager> list = mngService.mngKeySearch(sp);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/manager/manager_List");
		} else {
			throw new MemberException("관리자 검색에 실패했습니다.");
		}		
		return mv;
	}
	
	
	
	
	
	
	
	
	/* Level Select */	
	@RequestMapping("selectLevel.do")	
	public ModelAndView selectLevel(ModelAndView mv,
								  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page,
								  @ModelAttribute SearchPaging sp ) {
		
		System.out.println("value= " + sp.getSelectBtn());

		String a = sp.getSelectBtn();
		logger.info(a);
		
		int listCount = mngService.selectLevelCount(sp);
		int currentPage = page != null ? page : 1;		
		System.out.println("CRTL: " + listCount);

		sp = SPagination.getPageInfo(currentPage, listCount);
		
		sp.setSelectBtn(a);
		logger.info("a2= " + a);
		
		ArrayList<Manager> list = mngService.selectLevel(sp);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/manager/manager_List");
		} else {
			throw new MemberException("관리자 조회에 실패했습니다.");
		}		
		return mv;
	}
	
	
	
	
	
	/* UPDATE MANAGER */
	@RequestMapping("updateView.do")
	public ModelAndView updateView(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		
		String mngPosition = "";

		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int mNo = loginUser.getmNo();
		int mSortNo = loginUser.getmSortNo();
		
		if(loginUser != null) {
			mngPosition = mngService.updateView(mNo);
		}else {
			throw new MemberException("관리자 정보 조회에 실패했습니다.");
		}

		if(mngPosition != null) {
			mv.addObject("loginUser", loginUser)
			.addObject("mngPosition", mngPosition)
			.setViewName("admin/manager/manager_mypage");
			System.out.println("LoginUser= " + loginUser);
		}
		
		return mv;
	}
	
	@RequestMapping("updateMng.do")	
	public String updateMng(RedirectAttributes rd, HttpServletRequest request, @ModelAttribute Manager m, Model model) {	
		System.out.println("ㅋㅋㅋ" + m.getMngPosition());
		String encPwd = bcryptPasswordEncoder.encode(m.getMPwd());
		m.setMPwd(encPwd);
		int result = mngService.updateMng(m);
		
		//System.out.println("Ctrl:Update= " + rd.addAttribute(m));
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "정보가 수정되었습니다.");
			model.addAttribute("loginUser", m);
			return "redirect:managerList.do";
		} else {
			rd.addFlashAttribute("msg", "정보를 수정할 수 없습니다.");
			return "common/errorPage";
		}
	}
}




