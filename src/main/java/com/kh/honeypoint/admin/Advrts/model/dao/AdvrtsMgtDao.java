package com.kh.honeypoint.admin.Advrts.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.admin.Advrts.model.vo.AdvrtsMgt;
import com.kh.honeypoint.admin.common.PageInfo;

@Repository("adMDao")
public class AdvrtsMgtDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int AdvrtsListCount() {
		return Integer.parseInt((String) sqlSession.selectOne("advrtsMapper.advrtsListCount"));
	}

	public ArrayList<AdvrtsMgt> AdvrtsList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<AdvrtsMgt> list = (ArrayList)sqlSession.selectList("advrtsMapper.advrtsList", null, rowBounds);
		return list;
	}
	

	public int advrtsIn(int bNo) {
		return sqlSession.update("advrtsMapper.advrtsIn", bNo);
	}

	public int advrtsDel(int bNo) {
		return sqlSession.update("advrtsMapper.advrtsDel", bNo);
	}
	
	public int advrtsInView(int bNo) {
		return sqlSession.update("advrtsMapper.advrtsInView", bNo);
	}
	
	public AdvrtsMgt selectAdvrts(int bNo) {
		return sqlSession.selectOne("advrtsMapper.adDetail", bNo);
	}

	
	
	
	
	public int AdvrtsIListCount() {
		return Integer.parseInt((String) sqlSession.selectOne("advrtsMapper.advrtsIListCount"));
	}

	public ArrayList<AdvrtsMgt> AdvrtsIList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<AdvrtsMgt> list = (ArrayList)sqlSession.selectList("advrtsMapper.advrtsIList", null, rowBounds);
		return list;
	}
	
	public int advrtsOff(int bNo) {
		return sqlSession.update("advrtsMapper.advrtsOff", bNo);
	}

	
	
	
	
	public int advrtsDListCount() {
		return Integer.parseInt((String) sqlSession.selectOne("advrtsMapper.advrtsDListCount"));
	}

	public ArrayList<AdvrtsMgt> advrtsDList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<AdvrtsMgt> list = (ArrayList)sqlSession.selectList("advrtsMapper.advrtsDList", null, rowBounds);
		return list;
	}

	
	
	
	public int adInsert(AdvrtsMgt ad) {
		return sqlSession.insert("advrtsMapper.adInsert", ad);
	}
	

}
