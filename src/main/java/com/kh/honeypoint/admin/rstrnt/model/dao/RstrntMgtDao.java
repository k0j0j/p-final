package com.kh.honeypoint.admin.rstrnt.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.rstrnt.model.vo.RstrntMgt;

import com.kh.honeypoint.admin.member.model.vo.MemberMgt;

@Repository("rstMDao")
public class RstrntMgtDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/* RSTRNT-ALL */
	public int rstrntAllCount() {
		return Integer.parseInt((String) sqlSession.selectOne("rstrntMgtMapper.rstrntAllCount"));
	}

	public ArrayList<RstrntMgt> rstrntAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<RstrntMgt> list = (ArrayList)sqlSession.selectList("rstrntMgtMapper.rstrntAll", null, rowBounds);
		return list;
	}

	public int deleteRstMgt(int rNo) {
		return sqlSession.update("rstrntMgtMapper.deleteRstMgt", rNo);
	}
	
		

	/* RSTRNT-REGIST */
	public int rstrntRegistCount() {
		return Integer.parseInt((String) sqlSession.selectOne("rstrntMgtMapper.rstrntRegistCount"));
	}

	public ArrayList<RstrntMgt> rstrntRegist(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<RstrntMgt> list = (ArrayList)sqlSession.selectList("rstrntMgtMapper.rstrntRegist", null, rowBounds);
		return list;
	}

	public int insertRstMgt(int rNo) {
		return sqlSession.update("rstrntMgtMapper.insertRstMgt", rNo);
	}

		
	
	/* RSTRNT-REJECT */
	public int rstrntRejectCount() {
		return Integer.parseInt((String) sqlSession.selectOne("rstrntMgtMapper.rstrntRejectCount"));
	}

	public ArrayList<RstrntMgt> rstrntReject(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<RstrntMgt> list = (ArrayList)sqlSession.selectList("rstrntMgtMapper.rstrntReject", null, rowBounds);
		return list;
	}


	
	

	


}
