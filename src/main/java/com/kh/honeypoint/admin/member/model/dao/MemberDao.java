package com.kh.honeypoint.admin.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;

import sun.rmi.runtime.Log;

@Repository("mDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectListCount() {
		return Integer.parseInt(sqlSession.selectOne("memberMgtMapper.selectListCount"));
	}

	public ArrayList<MemberMgt> selectListCount(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<MemberMgt> list = (ArrayList)sqlSession.selectList("memberMgtMapper.memberListUp", rowBounds);
		/*System.out.println("Dao List: " + list);*/
		return list;
		/*
		return (ArrayList)sqlSession.selectList("memberMgtMapper.memberListUp", null, rowBounds);
		*/
	}
	
	
}
