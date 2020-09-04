package com.kh.honeypoint.admin.reportMgt.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.reportMgt.model.vo.Report;

public interface ReportMgtService {
	
	/* REPORT LIST*/
	public int selectListCount();
	public ArrayList<Report> selectReportList(PageInfo pi);
	
	/* MEMBER REPORT LIST */
	public int selectReportMemListCount();
	public ArrayList<Report> selectReportMemList(PageInfo pi);
	
	/* RSTRNT REPORT LIST */
	public int selectReportRstListCount();
	public ArrayList<Report> selectReportRstList(PageInfo pi);
	
	/* REPORT DELETE */
	public int deleteReportMgt(int mNo);
	public int deleteMemReportMgt(int mNo);
	public int deleteRstReportMgt(int mNo);
}
