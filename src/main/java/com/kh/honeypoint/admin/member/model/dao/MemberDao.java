package com.kh.honeypoint.admin.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;
import com.kh.honeypoint.admin.member.model.vo.Search;

import sun.rmi.runtime.Log;

@Repository("mDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int selectListCount() {
		return Integer.parseInt(sqlSession.selectOne("memberMgtMapper.selectListCount"));
	}

	/* MEMBER LIST */
	public ArrayList<MemberMgt> selectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<MemberMgt> list = (ArrayList)sqlSession.selectList("memberMgtMapper.memberListUp", null, rowBounds);
		return list;
	
		/*
		return (ArrayList)sqlSession.selectList("memberMgtMapper.memberListUp", null, rowBounds);
		*/
	}
	
	/* MEMBER SECSN LIST */
	public int memberSecsnListCount() {
		return Integer.parseInt(sqlSession.selectOne("memberMgtMapper.memberSecsnListCount"));
	}
	
	public ArrayList<MemberMgt> memberSecsnList(PageInfo pi) {	
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<MemberMgt> list = (ArrayList)sqlSession.selectList("memberMgtMapper.memberSecsnList", null, rowBounds);
		return list;
	}

	/* MEMBER DELETE */
	public int deleteMemberMgt(int mNo) {
		return sqlSession.update("memberMgtMapper.deleteMemberMgt", mNo);
	}

	/* MEMBER SEARCH */
	/*
	public ArrayList<MemberMgt> searchMemMgt(Search search) {
		System.out.println("saerch: " + search);
		ArrayList<MemberMgt> list = (ArrayList)sqlSession.selectList("memberMgtMapper.searchMemMgt", search);
		return list;
	}
	*//*
	public int searchMemMgt(String mName) {
		return sqlSession.selectOne("memberMgtMapper.searchMemMgt", mName);
	}
	*/
}
