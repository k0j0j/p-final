package com.kh.honeypoint.admin.Inqry.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.Inqry.model.vo.InqryMgt;
import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.reportMgt.model.vo.Report;

public interface InqryMgtService {

	public int selectListCount();
	public ArrayList<InqryMgt> InqryMgtList(PageInfo pi);
	
	
	
	
	
	public int InqryMgtMCount();
	public ArrayList<InqryMgt> InqryMgtM(PageInfo pi);
	
	
	
	
	
	public int InqryMgtRCount();
	public ArrayList<InqryMgt> InqryMgtR(PageInfo pi);
	
	
	
	
	
	public int InqryMgtListSearchCount(SearchPaging sp);
	public ArrayList<InqryMgt> InqryMgtListSearch(SearchPaging sp);
}
