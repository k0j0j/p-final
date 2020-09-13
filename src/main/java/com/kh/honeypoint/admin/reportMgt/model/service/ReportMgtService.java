package com.kh.honeypoint.admin.reportMgt.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;
import com.kh.honeypoint.admin.member.model.vo.Search;
import com.kh.honeypoint.admin.reportMgt.model.vo.Report;

public interface ReportMgtService {
	
	/* REPORT LIST*/
	public int selectListCount();
	public ArrayList<Report> selectReportList(PageInfo pi);
	
	public int mgtReportDel(int targetNo);
	public int mgtReportReturn(int prtNo);	
	
	/* MEMBER REPORT LIST */
	public int selectReportMemListCount();
	public ArrayList<Report> selectReportMemList(PageInfo pi);
	
	public int deleteMemReportMgt(int targetNo);
	public int mgtReportReturn2(int prtNo);
	
	/* RSTRNT REPORT LIST */
	public int selectReportRstListCount();
	public ArrayList<Report> selectReportRstList(PageInfo pi);
	
	public int deleteRstReportMgt(int targetNo);
	public int mgtReportReturn3(int prtNo);
		
	
	/* REPORT Search */	
	public int resportKeySearchCount(SearchPaging sp);
	public ArrayList<Report> resportKeySearch(SearchPaging sp);
	
}
