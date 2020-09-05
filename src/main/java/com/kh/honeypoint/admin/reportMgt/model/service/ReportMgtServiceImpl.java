package com.kh.honeypoint.admin.reportMgt.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.admin.common.PageInfo;
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

	/* MEMBER REPORT LIST */
	@Override
	public int selectReportMemListCount() {
		return rMgtDao.selectReportMemListCount();
	}

	@Override
	public ArrayList<Report> selectReportMemList(PageInfo pi) {
		return rMgtDao.selectReportMemList(pi);
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

	/* REPORT DELETE */
	@Override
	public int deleteReportMgt(int targetNo) {
		return rMgtDao.deleteReportMgt(targetNo);
	}

	@Override
	public int deleteMemReportMgt(int targetNo) {
		return rMgtDao.deleteMemReportMgt(targetNo);
	}

	@Override
	public int deleteRstReportMgt(int targetNo) {
		return rMgtDao.deleteRstReportMgt(targetNo);
	}
	

	

}
