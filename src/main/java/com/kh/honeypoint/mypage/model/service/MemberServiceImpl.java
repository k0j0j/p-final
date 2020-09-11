package com.kh.honeypoint.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.mypage.model.dao.MemberDao;
import com.kh.honeypoint.mypage.model.vo.Member;
import com.kh.honeypoint.mypage.model.vo.gnrlMember;
import com.kh.honeypoint.mypage.model.vo.mPassWord;

@Service("mmpService")
public class MemberServiceImpl implements MemberService{

	/* 암호화 */
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberDao mDao;
	
	
	/* 일반회원 정보수정 */
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}
	
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



	
}
