package com.kh.honeypoint.admin.reportMgt.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;
import com.kh.honeypoint.admin.member.model.vo.Search;
import com.kh.honeypoint.admin.reportMgt.model.vo.Report;

@Repository("rMgtDao")
public class ReportMgtDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/* REPORT LIST */
	public int selectListCount() {
			return Integer.parseInt((String) sqlSession.selectOne("reportMgtMapper.selectListCount"));
	}
	
	public ArrayList<Report> selectReportList(PageInfo pi){		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Report> list = (ArrayList)sqlSession.selectList("reportMgtMapper.selectReportList", null, rowBounds);
		return list;
	}

	/* MEMBER REPORT LIST */
	public int selectReportMemListCount() {
		return Integer.parseInt((String) sqlSession.selectOne("reportMgtMapper.selectReportMemListCount"));
	}

	public ArrayList<Report> selectReportMemList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Report> list = (ArrayList)sqlSession.selectList("reportMgtMapper.selectReportMemList", null, rowBounds);
		return list;
	}
	
	/* RSTRNT REPORT LIST */
	public int selectReportRstListCount() {
		return Integer.parseInt((String) sqlSession.selectOne("reportMgtMapper.selectReportRstListCount"));
	}

	public ArrayList<Report> selectReportRstList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<Report> list = (ArrayList)sqlSession.selectList("reportMgtMapper.selectReportRstList", null, rowBounds);
		return list;
	}

	/* REPORT DELETE */
	public int deleteReportMgt(int targetNo) {
		System.out.println("targetNo" + targetNo);
		return sqlSession.update("reportMgtMapper.deleteReportMgt", targetNo);
	}

	public int deleteMemReportMgt(int targetNo) {
		return sqlSession.update("reportMgtMapper.deleteMemReportMgt", targetNo);
	}

	public int deleteRstReportMgt(int targetNo) {
		return sqlSession.update("reportMgtMapper.deleteRstReportMgt", targetNo);
	}

	/* SEARCH */	
	public int resportKeySearchCount(SearchPaging sp) {
		return Integer.parseInt((String) sqlSession.selectOne("reportMgtMapper.resportKeySearchCount", sp));
	}

	public ArrayList<Report> resportKeySearch(SearchPaging sp) {
		System.out.println("Dao: " + sp);
		int offset = (sp.getCurrentPage() -1) * sp.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, sp.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reportMgtMapper.resportKeySearch", sp, rowbounds);
	}


	
}
