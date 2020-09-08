package com.kh.honeypoint.admin.manager.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Pagination;
import com.kh.honeypoint.admin.manager.model.exception.ManagerException;
import com.kh.honeypoint.admin.manager.model.service.ManagerService;
import com.kh.honeypoint.admin.manager.model.vo.Manager;

@SessionAttributes({"loginUser", "msg"})
@Controller
public class managerController {
	@Autowired
	private ManagerService mngService;
	
	private Logger logger = LoggerFactory.getLogger(managerController.class);
	
	/* MANAGER LIST */
	@RequestMapping("managerList.do")
	public ModelAndView managerList(ModelAndView mv, 
				  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page) {

		int currentPage = page != null ? page : 1;
		
		int listCount = mngService.selectMngCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Manager> list = mngService.selectMng(pi);

		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/admin/manager/manager_List");
		} else {
			throw new ManagerException("관리자 목록 조회에 실패했습니다.");
		}		
			return mv;
	}
	
	/* ID CHECK */
	@RequestMapping("idCheck.do")
	public ModelAndView inDuplicateCheck(String mngId, ModelAndView mv) {
		boolean isUsable = mngService.idCheck(mngId) == 0 ? true : false;
		
		Map map = new HashMap();
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("mngMypageUpdate.do")
	public String managerMypageUpdate() {
		return "admin/manager/manager_mypage";
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
}
