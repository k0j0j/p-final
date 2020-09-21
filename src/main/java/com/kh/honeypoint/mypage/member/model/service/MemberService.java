package com.kh.honeypoint.mypage.member.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.mypage.common.PageInfo;
import com.kh.honeypoint.member.model.vo.Member;
import com.kh.honeypoint.mypage.member.model.vo.PaidPoint;
import com.kh.honeypoint.mypage.member.model.vo.Post;
import com.kh.honeypoint.mypage.member.model.vo.ReservePay;
import com.kh.honeypoint.mypage.member.model.vo.UsedPoint;
import com.kh.honeypoint.mypage.member.model.vo.gnrlMember;
import com.kh.honeypoint.mypage.member.model.vo.mPassWord;

public interface MemberService {
	
	/* 회원정보 변경 */
	public int updateMember (Member m);	
	public int updategnrlMember(Member m2);	
	public int updatemPassWord(Member m3);
	
	
	/* 회원정보 탈퇴 */
	public int deleteMember(String mId);
	
	
	// 사이드바
	
	// 예약 및 결제내역
	public int selectReservePayListCount();
	public ArrayList<ReservePay> selectReservePayList(PageInfo pi);

	
	// 지급된 포인트내역
	public int selectPaidPointListCount();
	public ArrayList<PaidPoint> selectPaidPointList(PageInfo pi);

	
	// 사용한 포인트내역
	public int selectUsedPointListCount();
	public ArrayList<UsedPoint> selectUsedPointList(PageInfo pi);
	
	
	// 게시물 조회
	public int selectPostListCount();
	public ArrayList<Post> selectPostList(PageInfo pi);
	
	// 회원정보 조회
	public Member selectMemberInfo(int mNo);




	
}
