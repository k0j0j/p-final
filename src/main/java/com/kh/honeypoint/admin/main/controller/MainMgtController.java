package com.kh.honeypoint.admin.main.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.honeypoint.admin.Advrts.model.exception.AdvrtsMgtException;
import com.kh.honeypoint.admin.main.model.exception.MainMgtException;
import com.kh.honeypoint.admin.main.model.service.MainMgtService;
import com.kh.honeypoint.admin.main.model.vo.MainMgt;
import com.kh.honeypoint.admin.member.controller.memberMgtController;
import com.kh.honeypoint.member.model.vo.Member;

@SessionAttributes({"loginUser", "msg", "mngPosition"})
@Controller
public class MainMgtController {
	@Autowired
	private MainMgtService mainMService;
	
	private Logger logger = LoggerFactory.getLogger(memberMgtController.class);

	@RequestMapping("admin.do")
	public ModelAndView selectList(ModelAndView mv, @SessionAttribute Member loginUser, Model model) {
		String mngPosition = mainMService.selectMngPosition(loginUser.getmNo());
		model.addAttribute("mngPosition", mngPosition);
		
		if(loginUser.getmSortNo() != 3) {
			throw new AdvrtsMgtException("권한이 없습니다. 관리자만 접근 가능한 페이지입니다.");
		}
		
		System.out.println("CTRL: " + mv.getModel());
		ArrayList<MainMgt> result = mainMService.mainMgtListup(); 
		ArrayList<MainMgt> result2 = mainMService.mainMgtListup2();
		ArrayList<MainMgt> result3 = mainMService.mainMgtListup3();

		String count = mainMService.count();
		String count2 = mainMService.count2();
		String count3 = mainMService.count3();
		String count4 = mainMService.count4();
		String loginC = mainMService.loginC();
		
		
		if(result != null && result2 != null &&  result3 != null 
				/* && count != null && count2 != null &&  count3 != null && count4 != null */) {
			mv.addObject("result", result);		// inqry
			mv.addObject("result2", result2);	// report
			mv.addObject("result3", result3);	// advrts
			
			mv.addObject("count", count);
			mv.addObject("count2", count2);
			mv.addObject("count3", count3);
			mv.addObject("count4", count4);
			mv.addObject("loginC", loginC);
			
			
			mv.setViewName("/admin/common/admin_main");
		} else {
			throw new MainMgtException("미리보기 조회에 실패했습니다.");
		}		
		return mv;
	}
	
	
}
