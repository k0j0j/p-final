package com.kh.honeypoint.admin.manager.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Search;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.manager.model.vo.Manager;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;

public interface ManagerService {
	
	public int idCheck(String mId);
	
	/* Manager - list */
	public int selectMngCount();
	public ArrayList<Manager> selectMng(PageInfo pi);
	/*
	 Manager - delete >>>>>>>>>>>>>>>>>>>>>> MemberService로 이동
	public int deleteMgt(int mngNo);
	*/
	public int mngInsert(Manager m);
	
	/* Manager Search*/	
	public int mngKeySearchCount(SearchPaging sp);
	public ArrayList<Manager> mngKeySearch(SearchPaging sp);
	
	 /* Onchage */
	public int selectLevelCount(SearchPaging sp);
	public ArrayList<Manager> selectLevel(SearchPaging sp);
	 
}
