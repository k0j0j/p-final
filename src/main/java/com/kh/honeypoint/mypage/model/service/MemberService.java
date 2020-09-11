package com.kh.honeypoint.mypage.model.service;

import com.kh.honeypoint.mypage.model.vo.Member;
import com.kh.honeypoint.mypage.model.vo.gnrlMember;
import com.kh.honeypoint.mypage.model.vo.mPassWord;

public interface MemberService {
	
	/* 회원정보 변경 */
	public int updateMember (Member m);
	
	public int updategnrlMember(gnrlMember gm);
	
	public int updatemPassWord(mPassWord upw);
	
	
	
	/* 회원정보 탈퇴 */
	public int deleteMember(String mId);







}
