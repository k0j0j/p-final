package com.kh.honeypoint.mypage.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.honeypoint.mypage.common.Pagination;
import com.kh.honeypoint.mypage.common.PageInfo;
import com.kh.honeypoint.mypage.member.model.exception.ReservePayException;
import com.kh.honeypoint.mypage.member.model.exception.MemberException;
import com.kh.honeypoint.mypage.member.model.service.MemberService;
import com.kh.honeypoint.mypage.member.model.vo.PaidPoint;
import com.kh.honeypoint.mypage.member.model.vo.Post;
import com.kh.honeypoint.mypage.member.model.vo.ReservePay;
import com.kh.honeypoint.mypage.member.model.vo.UsedPoint;
import com.kh.honeypoint.mypage.member.model.vo.gnrlMember;
import com.kh.honeypoint.mypage.member.model.vo.mPassWord;
import com.kh.honeypoint.member.controller.memberController;
import com.kh.honeypoint.member.model.exception.memberException;
import com.kh.honeypoint.member.model.vo.Member;

@SessionAttributes({ "loginUser", "msg" })
@Controller
public class memberMyPageController {

	@Autowired
	private MemberService mService;

	private Logger logger = LoggerFactory.getLogger(memberController.class);

	/* 일반회원 마이페이지 */

	@RequestMapping("membermp.do")
	public String memberMyPage(HttpServletRequest request,HttpSession session) {
		

		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(loginUser.getmNo());
		
		System.out.println("loginUser" + loginUser);
		
		session = request.getSession();
		Member mem = (Member)session.getAttribute("loginUser");
		
		int mNo = mem.getmNo();

		System.out.println("mNo" + mNo);
		/*
		 * 
		 */
		return "mypage/member/memberMyPage";
	}

	/******* 사이드 메뉴 ********/
	/* 일반회원 예약 및 결제내역 */
	@RequestMapping("memberreservepaylist.do")
	public ModelAndView ReservePayList(ModelAndView mv,			
									   @RequestParam(value = "currentPage", 
									   required = false, 
									   defaultValue = "1") Integer page,
									   HttpSession session) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(loginUser.getmNo());
		int mNo = loginUser.getmNo();
		Member m = mService.selectMemberInfo(mNo);
		
		int currentPage = page != null ? page : 1;

		int listCount = mService.selectReservePayListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<ReservePay> list = mService.selectReservePayList(pi);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/mypage/member/memberReservePayList");
		} else {
			throw new MemberException("예약 결제내역이 존재하지 않습니다.");
		}

		return mv;
	}
	
	/* 포인트 지급내역 */
	@RequestMapping("memberpaidpoint.do")
	public ModelAndView MemberPaidPointList(ModelAndView mv, 
									  @RequestParam(value="currentPage",
									  required=false,
									  defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		int listCount = mService.selectPaidPointListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);		
		
		ArrayList<PaidPoint> list = mService.selectPaidPointList(pi); 
		
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/mypage/member/memberPaidPointList");
		} else {
			throw new MemberException("포인트 지급내역이 존재하지 않습니다.");
		}
		
		return mv;
	}
	
	/* 포인트 사용내역 */
	@RequestMapping("memberusedpoint.do")
	public ModelAndView MemberUsedPointList(ModelAndView mv,
									  @RequestParam(value="currentPage",
									  required=false,
									  defaultValue="1") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		int listCount = mService.selectUsedPointListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<UsedPoint> list = mService.selectUsedPointList(pi);
		
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("/mypage/member/memberUsedPointList");
		} else {
			throw new MemberException("포인트 사용내역이 존재하지 않습니다.");
		}
				
		
		return mv;
	}
	

	/* 작성 게시글목록 조회 */
	@RequestMapping("memberpost.do")
	public String MemberPostList(Model model, 
								 @RequestParam(value="currentPage",
								 required=false,
								 defaultValue="1") Integer page) {

		int currentPage = page != null ? page : 1;
		
		int listCount = mService.selectPostListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Post> list = mService.selectPostList(pi);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		
		return "mypage/member/memberPostList";
		
	}

	/* 찜한 맛집내역 조회 */
	@RequestMapping("memberfavor.do")
	public String MemberFavorRstrnt() {
		return "mypage/member/memberFavorRstrnt";
	}
	

	

	/* 최근 본 맛집내역 조회 */
	@RequestMapping("recentviewrstrnt.do")
	public String RecentViewRstrnt() {
		return "mypage/member/recentViewRstrnt";
	}


	/******* 본문 ********/

	/*
	 * 최근 결제내역
	 * 
	 * @RequestMapping("memberrecentpay.do") public String
	 * MemberRecentPayListPointList() { return "mypage/member/memberUsedPointList";
	 * }
	 */

	// 최근 작성한 리뷰
	@RequestMapping("recentreview.do")
	public String RecentReviewPage() {
		return "mypage/member/recentReviewPage";
	}

	// 일반회원 정보변경
	@RequestMapping("memberinfochange.do")
	public ModelAndView memberInfoChange(ModelAndView mv,HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(loginUser.getmNo());
		int mNo = loginUser.getmNo();
		Member m = mService.selectMemberInfo(mNo);
		String[] address = m.getmAddress().split(",");
		
		String post = address[0];
		String address1 = address[1];
		String address2 = address[2];
		
		
		
		mv.addObject("m",m);
		mv.addObject("post", post);
		mv.addObject("address1", address1);
		mv.addObject("address2", address2);
		mv.setViewName("mypage/member/memberInfoChange");
		
		return mv;
	}

	@RequestMapping(value = "memberUpdate.do", method = RequestMethod.POST)
	public String memberUpdate(Member m,Member m2,Member m3,
							RedirectAttributes rd, 
							@RequestParam("mNo") int mNo,
							@RequestParam("post") String post, 
							@RequestParam("address1") String address1,
							@RequestParam("address2") String address2,
							HttpServletRequest request,HttpSession session) {
		
		m.setmNo(mNo);
		m2.setmNo(mNo);
		m3.setmNo(mNo);
		
		m2.setmAddress(post + "," + address1 + "," + address2);
		
		System.out.println(m);

		int result = mService.updateMember(m);
		int result2 = mService.updategnrlMember(m2);
		int result3 = mService.updatemPassWord(m3);

		System.out.println(result);

		if (result > 0 && result2 > 0 && result3 > 0) {
			rd.addFlashAttribute("msg", "회원정보가 수정되었습니다.");
			//session 비워주고 mno로 로그인 유저를 받고 세션에 담고 membermpdao
/*			m.addAttribute("loginUser", m); */
/*			return "redirect:membermp.do";*/
			request.getSession();
			session.invalidate();
			
			
			// ㅇㅇㅇ 업데이트 m 하고 result 123 값들 ㅇㅇㅇ 
			
			return "redirect:membermp.do"; 
		} else {
			throw new memberException("회원정보 수정에 실패하였습니다.");
		}
	}
	

	// 일반회원 탈퇴
	@RequestMapping("memberdeletepage.do")
	public String MemberDeletePage(String mId, Model model, SessionStatus status,
			RedirectAttributes rd) {
	
		int result = mService.deleteMember(mId);

		if (result > 0) {
			rd.addFlashAttribute("msg", "회원 탈퇴가 완료 되었습니다");
			status.setComplete();
			return "redirect:main.do";
		} else {
			throw new MemberException("회원 탈퇴에 실패 하였습니다.");
		}

	}
	
	
}
