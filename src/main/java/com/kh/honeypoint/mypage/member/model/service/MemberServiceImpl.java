package com.kh.honeypoint.mypage.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.mypage.common.PageInfo;
import com.kh.honeypoint.mypage.member.model.dao.MemberDao;
import com.kh.honeypoint.member.model.vo.Member;
import com.kh.honeypoint.mypage.member.model.vo.ReservePay;
import com.kh.honeypoint.mypage.member.model.vo.gnrlMember;
import com.kh.honeypoint.mypage.member.model.vo.mPassWord;

@Service("mmpService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao mDao;

	
	/* 일반회원 정보수정 */
	/*@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}*/
	
	@Override
	public int updategnrlMember(gnrlMember gm) {
		return mDao.updategnrlMember(gm);
	}
	
	
	
	@Override
	public int updatemPassWord(mPassWord upw) {
		return mDao.updatemPassWord(upw);
	}
	

	/* 일반회원 탈퇴 */
	@Override
	public int deleteMember(String mId) {
		return mDao.deleteMember(mId);
	}

	
	/* 예약, 결제내역 */
	@Override
	public int ReservePayListCount() {
		return mDao.ReservePayListCount();
	}

	@Override
	public ArrayList<ReservePay> ReservePayList(PageInfo pi) {
		return mDao.ReservePayList(pi);
	}



	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public Member loginMember(Member m) {
		// TODO Auto-generated method stub
		return null;
	}


	
}
