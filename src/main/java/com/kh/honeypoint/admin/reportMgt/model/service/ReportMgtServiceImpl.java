package com.kh.honeypoint.admin.reportMgt.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;
import com.kh.honeypoint.admin.member.model.vo.Search;
import com.kh.honeypoint.admin.reportMgt.model.dao.ReportMgtDao;
import com.kh.honeypoint.admin.reportMgt.model.vo.Report;

@Service("rMgtService")
public class ReportMgtServiceImpl implements ReportMgtService{
	@Autowired
	private ReportMgtDao rMgtDao;

	/* REPORT LIST */
	@Override
	public int selectListCount() {
		return rMgtDao.selectListCount();
	}

	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		return rMgtDao.selectReportList(pi);
	}

	@Override
	public int mgtReportDel(int targetNo) {
		return rMgtDao.mgtReportDel(targetNo);
	}
	
	@Override
	public int mgtReportReturn(int prtNo) {
		return rMgtDao.mgtReportReturn(prtNo);
	}
	
	
	
	
	
	
	/* MEMBER REPORT LIST */
	@Override
	public int selectReportMemListCount() {
		return rMgtDao.selectReportMemListCount();
	}

	@Override
	public ArrayList<Report> selectReportMemList(PageInfo pi) {
		return rMgtDao.selectReportMemList(pi);
	}

	@Override
	public int deleteMemReportMgt(int targetNo) {
		return rMgtDao.deleteMemReportMgt(targetNo);
	}
	
	@Override
	public int mgtReportReturn2(int prtNo) {
		return rMgtDao.mgtReportReturn(prtNo);
	}
	
	
	
	
	
	
	
	/* RSTRNT REPORT LIST */
	@Override
	public int selectReportRstListCount() {
		return rMgtDao.selectReportRstListCount();
	}

	@Override
	public ArrayList<Report> selectReportRstList(PageInfo pi) {
		return rMgtDao.selectReportRstList(pi);
	}

	@Override
	public int deleteRstReportMgt(int targetNo) {
		return rMgtDao.deleteRstReportMgt(targetNo);
	}

	@Override
	public int mgtReportReturn3(int prtNo) {
		return rMgtDao.mgtReportReturn(prtNo);
	}

	
	
	
	
	
	
	
	
	
	
	/* SEARCH */
	@Override
	public int resportKeySearchCount(SearchPaging sp) {
		return rMgtDao.resportKeySearchCount(sp);
	}

	@Override
	public ArrayList<Report> resportKeySearch(SearchPaging sp) {
		return rMgtDao.resportKeySearch(sp);
	}
	

	

}
