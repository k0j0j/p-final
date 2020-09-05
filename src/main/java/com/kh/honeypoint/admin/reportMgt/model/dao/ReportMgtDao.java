package com.kh.honeypoint.admin.reportMgt.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.admin.common.PageInfo;
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
<<<<<<< HEAD
		System.out.println("targetNo: " + targetNo);
=======
		System.out.println("targetNo" + targetNo);
>>>>>>> GJ
		return sqlSession.update("reportMgtMapper.deleteReportMgt", targetNo);
	}

	public int deleteMemReportMgt(int targetNo) {
		return sqlSession.update("reportMgtMapper.deleteMemReportMgt", targetNo);
	}

	public int deleteRstReportMgt(int targetNo) {
		return sqlSession.update("reportMgtMapper.deleteRstReportMgt", targetNo);
	}

}
