package com.kh.honeypoint.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.honeypoint.member.model.exception.memberException;
import com.kh.honeypoint.member.model.service.memberService;
import com.kh.honeypoint.member.model.vo.InsertResImg;
import com.kh.honeypoint.member.model.vo.Member;
import com.kh.honeypoint.member.model.vo.Menu;
import com.kh.honeypoint.member.model.vo.Restaurant;
import com.kh.honeypoint.restaurant.model.exception.RestaurantException;
import com.kh.honeypoint.restaurant.model.vo.InsertReviewImg;
import com.kh.honeypoint.restaurant.model.vo.Review;

@SessionAttributes({ "loginUser", "msg" })
@Controller
public class memberController {

	@Autowired
	private memberService mService;

	private Logger logger = LoggerFactory.getLogger(memberController.class);

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		Member loginUser = mService.loginMember(m);
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			// sessionScope에 해당 객체가 저장 됨
			return "../../index";
		} else {
			throw new memberException("로그인에 실패하였습니다");
		}
	}

	// 로그아웃 컨트롤러
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:main.do";
	}

	@RequestMapping("loginPage.do")
	public String loginPage() {
		return "member/login";
	}

	@RequestMapping("joinPage.do")
	public String joinPage() {
		return "member/join";
	}

	@RequestMapping("resMenu.do")
	public String ResMenu() {
		return "member/ResMenu";
	}

	@RequestMapping("minsert.do")
	public String memberInsert(Member m1, Member m2, Member m3, RedirectAttributes rd,
			@RequestParam("post") String post, @RequestParam("address1") String address1,
			@RequestParam("address2") String address2, @RequestParam("year") String year,
			@RequestParam("month") String month, @RequestParam("day") String day) {

		m2.setmAddress(post + "," + address1 + "," + address2);
		m2.setmBirthday(year + month + day);

		int result1 = mService.insertMember1(m1);
		int result2 = mService.insertMember2(m2);
		int result3 = mService.insertMember3(m3);

		if (result1 > 0 && result2 > 0 && result3 > 0) {
			return "member/mFinish";
		} else {
			throw new memberException("회원가입에 실패하였습니다.");
		}
	}

	@RequestMapping("rinsert.do")
	public String resInsert(Restaurant r1, Restaurant r2, Restaurant r3, RedirectAttributes rd,
			@RequestParam("post") String post, @RequestParam("rAddress") String rAddress) {

		r2.setrAddress(post + "," + rAddress);

		int result1 = mService.insertRes1(r1);
		int result2 = mService.insertRes2(r2);
		int result3 = mService.insertRes3(r3);

		if (result1 > 0 && result2 > 0 && result3 > 0) {
			return "member/ResMenu";
		} else {
			throw new memberException("회원가입에 실패하였습니다.");
		}
	}

	@RequestMapping("dupid.do")
	public ModelAndView idDuplicateCheck(String mId, ModelAndView mv) {
		boolean isUsable = mService.checkIdDup(mId) == 0 ? true : false;

		Map map = new HashMap();
		map.put("isUsable", isUsable);
		mv.addAllObjects(map);

		mv.setViewName("jsonView");

		return mv;
	}

	@RequestMapping(value = "insertMenu.do", method = RequestMethod.POST)
	public String menuInsert(Menu menu, HttpServletRequest request, MultipartHttpServletRequest multi) {
		int rNo = mService.selectRno();
		
		
		String[] menuName = request.getParameterValues("menuName"); 
		String[] menuPrice = request.getParameterValues("menuPrice"); 
		int result = 0;
		int result2 = 0;
		for (int i = 0; i < menuName.length; i++) { 
			System.out.println(menuName[i]); 
			result = mService.insertMenu(rNo,menuName[i],Integer.parseInt(menuPrice[i]));
			}
		

		if (result > 0) { // 메뉴 가격등등 추가 완료됬을때
			if (multi.getFileNames().hasNext()) {// 맛집 이미지파일이 존재할때
				
				System.out.println("첫번째");
				
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "//img//detailview";
				String fileName = "";
				ArrayList<String> originFileList = new ArrayList<String>();
				ArrayList<String> renameFileList = new ArrayList<String>();

				File folder = new File(savePath);

				if (folder.exists()) {
					folder.mkdirs();
				}

				Iterator<String> files = multi.getFileNames();
				
				System.out.println("두번째");
				
				while (files.hasNext()) {
					String uploadFile = files.next();

					MultipartFile mFile = multi.getFile(uploadFile);
					System.out.println("원본 파일 이름 : " + mFile.getOriginalFilename());
					if (mFile.getOriginalFilename().equals("")) {
						continue;
					}

					// 파일 이름짓기
					int ranNum = (int) (Math.random() * 100000);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String originFileName = mFile.getOriginalFilename();
					fileName = sdf.format(new Date()) + "_" + ranNum
							+ originFileName.substring(originFileName.lastIndexOf("."));

					try {
						System.out.println(folder + "//" + fileName);
						mFile.transferTo(new File(folder + "//" + fileName));
						originFileList.add(originFileName);
						renameFileList.add(fileName);
					} catch (Exception e) {
						e.printStackTrace();
					}

				}
				InsertResImg value = new InsertResImg();

				value.setrNo(menu.getrNo());
				value.setOriginFileList(originFileList);
				value.setRenameFileList(renameFileList);

				System.out.println("---------파일밸류값 확인 : "+ value);
				for (int i = 0; i < originFileList.size(); i++) { 
					System.out.println(originFileList.get(i)); 
					result2 = mService.insertResImg(rNo,originFileList.get(i),renameFileList.get(i));
					}
				
				if (result2 > 0) {
					System.out.println("맛집 이미지 디비 등록완료");
					
				} else {
					System.out.println("맛집 이미지 디비 등록실패");
				}
			}else {
				System.out.println("맛집 이미지 추가해야함");
			}
		} else {
			throw new memberException("맛집 등록에 실패하였습니다.");
		}
		return "member/rFinish";
	}
	
	
}