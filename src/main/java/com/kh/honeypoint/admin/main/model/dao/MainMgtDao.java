package com.kh.honeypoint.admin.main.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.admin.main.model.vo.MainMgt;

@Repository("mainMDao")
public class MainMgtDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<MainMgt> mainMgtListup() {
		return (ArrayList)sqlSession.selectList("mainMgtMapper.mainMgtListup");
	}

	public ArrayList<MainMgt> mainMgtListup2() {
		return (ArrayList)sqlSession.selectList("mainMgtMapper.mainMgtListup2");
	}

	public ArrayList<MainMgt> mainMgtListup3() {
		return (ArrayList)sqlSession.selectList("mainMgtMapper.mainMgtListup3");
	}

	
	
	
	
	public ArrayList<MainMgt> mCounting() {
		return (ArrayList)sqlSession.selectList("mainMgtMapper.mCounting");
	}

	public ArrayList<MainMgt> rtCounting() {
		return (ArrayList)sqlSession.selectList("mainMgtMapper.rtCounting");
	}

	public ArrayList<MainMgt> reCounting() {
		return (ArrayList)sqlSession.selectList("mainMgtMapper.reCounting");
	}
}