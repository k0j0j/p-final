package com.kh.honeypoint.admin.manager.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Search;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.manager.model.vo.Manager;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;
import com.kh.honeypoint.member.model.vo.Member;

public interface ManagerService {
	
	public int idCheck(String mId);
	
	/* Manager - list */
	public int selectMngCount();
	public ArrayList<Manager> selectMng(PageInfo pi);
	/*
	 Manager - delete >>>>>>>>>>>>>>>>>>>>>> MemberService로 이동
	*/
	public int mngInsert(Manager m);
	
	/* Manager Search*/	
	public int mngKeySearchCount(SearchPaging sp);
	public ArrayList<Manager> mngKeySearch(SearchPaging sp);
	
	 /* Onchage */
	public int selectLevelCount(SearchPaging sp);
	public ArrayList<Manager> selectLevel(SearchPaging sp);
	 
	/* Update */
	/*public Manager updateView(Manager m);	*/// 조회
	public String updateView(int mNo);
	public int updateMng(Manager m);		// 등록
}
