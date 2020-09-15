package com.kh.honeypoint.admin.main.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.honeypoint.admin.main.model.exception.MainMgtException;
import com.kh.honeypoint.admin.main.model.service.MainMgtService;
import com.kh.honeypoint.admin.main.model.vo.MainMgt;
import com.kh.honeypoint.admin.member.controller.memberMgtController;

@Controller
public class MainMgtController {
	@Autowired
	private MainMgtService mainMService;
	
	private Logger logger = LoggerFactory.getLogger(memberMgtController.class);

	@RequestMapping("admin.do")
	public ModelAndView selectList(ModelAndView mv) {
		System.out.println("CTRL: " + mv.getModel());
		ArrayList<MainMgt> result = mainMService.mainMgtListup(); 
		ArrayList<MainMgt> result2 = mainMService.mainMgtListup2();
		ArrayList<MainMgt> result3 = mainMService.mainMgtListup3();
		
		ArrayList<MainMgt> mCount = mainMService.mCounting();
		ArrayList<MainMgt> rtCount = mainMService.rtCounting();
		ArrayList<MainMgt> reCount = mainMService.reCounting();		
		
		if(result != null && result2 != null &&  result3 != null &&
				mCount != null && rtCount != null &&  reCount != null ) {
			mv.addObject("result", result);		// inqry
			mv.addObject("result2", result2);	// report
			mv.addObject("result3", result3);	// advrts
			
			mv.addObject("mCount", mCount);
			mv.addObject("rtCount", rtCount);
			mv.addObject("reCount", reCount);
			
			mv.setViewName("/admin/common/admin_main");
		} else {
			throw new MainMgtException("미리보기 조회에 실패했습니다.");
		}		
		return mv;
	}
}
