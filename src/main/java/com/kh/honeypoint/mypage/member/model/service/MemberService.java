package com.kh.honeypoint.mypage.member.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.mypage.common.PageInfo;
import com.kh.honeypoint.member.model.vo.Member;
import com.kh.honeypoint.mypage.member.model.vo.PaidPoint;
import com.kh.honeypoint.mypage.member.model.vo.ReservePay;
import com.kh.honeypoint.mypage.member.model.vo.gnrlMember;
import com.kh.honeypoint.mypage.member.model.vo.mPassWord;

public interface MemberService {
	
	/* 회원정보 변경 */
	public int updateMember (Member m);
	
	public int updategnrlMember(gnrlMember gm);
	
	public int updatemPassWord(mPassWord upw);

	
	
	/* 회원정보 탈퇴 */
	public int deleteMember(String mId);
	
	
	// 사이드바
	
	// 예약 및 결제내역
	public int selectReservePayListCount();
	public ArrayList<ReservePay> selectReservePayList(PageInfo pi);

	// 지급된 포인트내역
	public int selectPaidPointListCount();
	public ArrayList<PaidPoint> selectPaidPointList(PageInfo pi);
}
