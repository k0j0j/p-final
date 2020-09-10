package com.kh.honeypoint.member.model.service;

import com.kh.honeypoint.member.model.vo.Member;

public interface memberService {

	// 1. 회원 로그인 서비스를 위한 메소드
	public Member loginMember(Member m);

	// 2. 회원 가입 서비스를 위한 메소드
	public int insertMember1(Member m1);
	public int insertMember2(Member m2);
	public int insertMember3(Member m3);
	
	// 3. 아이디 중복 검사를 위한 메소드
	public int checkIdDup(String id);
}
