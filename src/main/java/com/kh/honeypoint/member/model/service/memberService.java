package com.kh.honeypoint.member.model.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.kh.honeypoint.member.model.vo.InsertResImg;
import com.kh.honeypoint.member.model.vo.Member;
import com.kh.honeypoint.member.model.vo.Menu;
import com.kh.honeypoint.member.model.vo.Restaurant;

public interface memberService {

	// 1. 회원 로그인 서비스를 위한 메소드
	public Member loginMember(Member m);

	// 2. 일반 회원 가입 서비스를 위한 메소드
	public int insertMember1(Member m1);
	public int insertMember2(Member m2);
	public int insertMember3(Member m3);
	
	// 3. 맛집 회원 가입 서비스를 위한 메소드
	public int insertRes1(Restaurant r1);
	public int insertRes2(Restaurant r2);
	public int insertRes3(Restaurant r3);
	
	// 4. 아이디 중복 검사를 위한 메소드
	public int checkIdDup(String id);

	// 메뉴 리스트 추가
	public int insertMenu(int rNo, String menuName, int menuPrice);

	// 레스토랑 이미지 추가
	public int insertResImg(int rNo, String originFileList, String renameFileList);

	public int selectRno();

	public int loginHistory(Member loginUser);

	public String find_id(HttpServletResponse response, String email) throws IOException, Exception;

	public void find_pwd(HttpServletResponse response, String id, String email) throws IOException;

	void send_mail(Member member, String div);

	public int find_id_email(String email);

	Member find_id_email2(String email);



	


}
