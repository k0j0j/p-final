package com.kh.honeypoint.admin.rstrnt.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Search;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;
import com.kh.honeypoint.admin.rstrnt.model.vo.RstrntMgt;

public interface RstrntMgtService {
	/* ALL-LIST */
	public int rstrntAllCount();
	public ArrayList<RstrntMgt> rstrntAll(PageInfo pi);

	/* RSTRNT-Delete*/
	public int deleteRstMgt(int rNo);
	
	/* SEARCH */
	public int rstKeySearchCount(SearchPaging sp);
	public ArrayList<RstrntMgt> rstKeySearch(SearchPaging sp);
	
	
	/* RSTRNT-REGIST */
	public int rstrntRegistCount();
	public ArrayList<RstrntMgt> rstrntRegist(PageInfo pi);
	/* RSTRNT-INSERT */
	public int insertRstMgt(int rNo);
	/* RSTRNT-DELETE */
	public int jestctRstMgt(int rNo);
	
	/* RSTRNT-REJECT */
	public int rstrntRejectCount();
	public ArrayList<RstrntMgt> rstrntReject(PageInfo pi);
	
}
