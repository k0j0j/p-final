package com.kh.honeypoint.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.mypage.model.vo.Member;
import com.kh.honeypoint.mypage.model.vo.gnrlMember;
import com.kh.honeypoint.mypage.model.vo.mPassWord;

@Repository("mmpDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	
	// 일반회원 정보수정
	public int updateMember(Member m) {
		return sqlSession.update("membermpMapper.updateMember", m);				
	}
	
	public int updategnrlMember(gnrlMember gm) {
		return sqlSession.update("membermpMapper.updategnrlMember", gm);
	}

	public int updatemPassWord(mPassWord upw) {
		return sqlSession.update("membermpMapper.updatemPassWord",upw);
	}

	// 일반회원 탈퇴
	public int deleteMember(String mId) {
		return sqlSession.delete("membermpMapper.deleteMember", mId);
	}



}
