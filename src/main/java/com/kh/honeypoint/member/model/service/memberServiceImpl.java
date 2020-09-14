package com.kh.honeypoint.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.member.model.dao.memberDao;
import com.kh.honeypoint.member.model.vo.Member;
import com.kh.honeypoint.member.model.vo.Restaurant;


@Service("memService")
public class memberServiceImpl implements memberService {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private memberDao mDao;
	
	@Override
	public Member loginMember(Member m) {
		
		Member loginUser = mDao.selectMember(m);
		
		if(!bcryptPasswordEncoder.matches(m.getmPwd(), loginUser.getmPwd())) {
			
			// 첫번째 인자로 로그인시 입력한 pwd 평문
			// 두번째 인자로 회원가입시 생성 된 pwd 다이제스트
			// match되지 않으면 비밀번호 틀린 것이므로 loginUser를 null처리
			loginUser = null;
			
		}
		return loginUser;
	}

	@Override
	public int insertMember1(Member m1) {
		return mDao.insertMember1(m1);
	}
	@Override
	public int insertMember2(Member m2) {
		return mDao.insertMember2(m2);
	}
	@Override
	public int insertMember3(Member m3) {
		String encPwd = bcryptPasswordEncoder.encode(m3.getmPwd());
		m3.setmPwd(encPwd);
		return mDao.insertMember3(m3);
	}

	@Override
	public int insertRes1(Restaurant r1) {
		return mDao.insertRes1(r1);
	}

	@Override
	public int insertRes2(Restaurant r2) {
		return mDao.insertRes2(r2);
	}

	@Override
	public int insertRes3(Restaurant r3) {
		String encPwd = bcryptPasswordEncoder.encode(r3.getmPwd());
		r3.setmPwd(encPwd);
		return mDao.insertRes3(r3);
	}
	
	
	@Override
	public int checkIdDup(String mId) {
		return mDao.checkIdDup(mId);
	}
}

