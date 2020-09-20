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

	
	
	
/*	
	public ArrayList<MainMgt> count() {
		return (ArrayList)sqlSession.selectList("mainMgtMapper.count");
	}

	public ArrayList<MainMgt> count2() {
		return (ArrayList)sqlSession.selectList("mainMgtMapper.count2");
	}

	public ArrayList<MainMgt> count3() {
		return (ArrayList)sqlSession.selectList("mainMgtMapper.count3");
	}
	
	public ArrayList<MainMgt> count4() {
		return (ArrayList)sqlSession.selectList("mainMgtMapper.count3");
	}
	*/
	
	
	
	
	
	public String count() {		
		return sqlSession.selectOne("mainMgtMapper.count");
	}
	
	public String count2() {
		return sqlSession.selectOne("mainMgtMapper.count2");
	}
	
	public String count3() {
		return sqlSession.selectOne("mainMgtMapper.count3");
	}
	
	public String count4() {
		return sqlSession.selectOne("mainMgtMapper.count4");
	}

	public String loginC() {
		return sqlSession.selectOne("mainMgtMapper.loginC");
	}

	public String selectMngPosition(int getmNo) {
		return sqlSession.selectOne("mainMgtMapper.selectMngPosition", getmNo);
	}
		
}