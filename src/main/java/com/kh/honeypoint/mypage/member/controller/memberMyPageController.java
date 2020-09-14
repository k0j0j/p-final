package com.kh.honeypoint.mypage.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.honeypoint.mypage.model.exception.MemberException;
import com.kh.honeypoint.mypage.model.service.MemberService;
import com.kh.honeypoint.mypage.model.vo.Member;
import com.kh.honeypoint.mypage.model.vo.gnrlMember;
import com.kh.honeypoint.mypage.model.vo.mPassWord;

@SessionAttributes({"loginUser","msg"})
@Controller
public class memberMyPageController {
	
	@Autowired
	private MemberService mService;
	
	/* 일반회원 마이페이지 */
	
	@RequestMapping("membermp.do")
	public String memberMyPage() {			
		return "mypage/member/memberMyPage";
	}
	
	/******* 사이드 메뉴 ********/
	/* 일반회원 예약 및 결제내역 */
	@RequestMapping("memberreservepaylist.do")
	public String memberReservePayList() {
		return "mypage/member/memberReservePayList";		
	}
	
	/* 환불 신청 및 조회 */
	@RequestMapping("memberrefund.do")
	public String MemberRefundPage() {
		return "mypage/member/memberRefundPage";
	}
	
	/* 포인트 지급내역 조회 */
	@RequestMapping("memberpaidpoint.do")
	public String MemberPaidPointList() {
		return "mypage/member/memberPaidPointList";
	}
	
	/* 포인트 사용내역 조회 */
	@RequestMapping("memberusedpoint.do")
	public String MemberUsedPointList() {
		return "mypage/member/memberUsedPointList";
	}
	
	/* 최근 본 맛집내역 조회 */
	@RequestMapping("recentviewrstrnt.do")
	public String RecentViewRstrnt() {
		return "mypage/member/recentViewRstrnt";
	}
	
	/* 찜한 맛집내역 조회 */
	@RequestMapping("memberfavorrstrnt.do")
	public String MemberFavorRstrnt() {
		return "mypage/member/memberFavorRstrnt";
	}
	
	/******* 본문 ********/
	
	/* 최근 결제내역 
	@RequestMapping("memberrecentpay.do")
	public String MemberRecentPayListPointList() {
		return "mypage/member/memberUsedPointList";
	}*/
	
	// 최근 작성한 리뷰
	@RequestMapping("recentreview.do")
	public String RecentReviewPage() {
		return "mypage/member/recentReviewPage";
	}
	
	// 일반회원 정보변경
	@RequestMapping("memberinfochange.do")
	public String memberInfoChange() {
		return "mypage/member/memberInfoChange";
	}
	
	
	@RequestMapping(value="mypage/member/memberinfochange.do", method=RequestMethod.POST)
	public String memberUpdate(@ModelAttribute Member m,
							   @ModelAttribute gnrlMember gm,
							   @ModelAttribute mPassWord upw,
							   RedirectAttributes rd) {
		
		System.out.println(m);
		
		int result = mService.updateMember(m);
		int result2 = mService.updategnrlMember(gm);
		int result3 = mService.updatemPassWord(upw);
		
		System.out.println(result);
		
		if(result > 0 && result2 > 0 && result3 > 0) {
			rd.addFlashAttribute("msg", "회원정보가 수정되었습니다.");
/*			m.addAttribute("loginUser", m);*/
			return "redirect:membermp.do";
		}else {
			throw new MemberException("회원정보 수정에 실패하였습니다.");
		}
	}
	
	// 일반회원 탈퇴
	@RequestMapping("memberdeletepage.do")
	public String MemberDeletePage(String mId, Model model, SessionStatus status, RedirectAttributes rd) {
		// 비밀번호 체크
		
		int result = mService.deleteMember(mId);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "회원 탈퇴가 완료 되었습니다");
			status.setComplete();
			return "redirect:main.do";
		}else {
			throw new MemberException("회원 탈퇴에 실패 하였습니다.");
		}
		
		
	}
	
	
	
}
