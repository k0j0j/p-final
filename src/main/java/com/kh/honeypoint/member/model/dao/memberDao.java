package com.kh.honeypoint.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.member.model.vo.Member;


@Repository("memDao")	 
public class memberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.selectOne",m);
	}
	public int insertMember1(Member m1) {
		return sqlSession.insert("memberMapper.insertMember1", m1);
	}
	public int insertMember2(Member m2) {
		return sqlSession.insert("memberMapper.insertMember2", m2);
	}
	public int insertMember3(Member m3) {
		return sqlSession.insert("memberMapper.insertMember3", m3);
	}

	public int checkIdDup(String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}
	

}
