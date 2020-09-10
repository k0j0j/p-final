package com.kh.honeypoint.admin.manager.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Search;
import com.kh.honeypoint.admin.manager.model.vo.Manager;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;

@Repository("mngDao")
public class ManagerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int idCheck(String mngId) {
		System.out.println("DaoId: " + mngId);
		return sqlSession.selectOne("managerMapper.idCheck", mngId);
	}

	/* MANAGER LIST */
	public int selectMngCount() {
		return Integer.parseInt((String) sqlSession.selectOne("managerMapper.selectMngCount"));
	}

	public ArrayList<Manager> selectMng(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Manager> list = (ArrayList)sqlSession.selectList("managerMapper.selectMng", null, rowBounds);
		System.out.println("list: " + list.toString());
		return list;
	}

	public int deleteMgt(int mngNo) {
		System.out.println("Dao: " + mngNo);
		return sqlSession.update("manaberMapper.deleteMgt", mngNo);
	}

	/* MANAGER-INSERT */
	public int mngInsert(Manager m) {
		return sqlSession.insert("managerMapper.mngInsert", m);
	}

	/* SEARCH */
	public ArrayList<Manager> mngKeySearch(Search search) {
		System.out.println("Dao: " + search);
		return (ArrayList)sqlSession.selectList("managerMapper.mngKeySearch", search);
	}

	
	
	
	

}
