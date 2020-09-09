package com.kh.honeypoint.admin.manager.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Search;
import com.kh.honeypoint.admin.manager.model.vo.Manager;

public interface ManagerService {
	
	public int idCheck(String mngId);
	
	/* Manager - list */
	public int selectMngCount();
	public ArrayList<Manager> selectMng(PageInfo pi);
	/*
	 Manager - delete >>>>>>>>>>>>>>>>>>>>>> MemberService로 이동
	public int deleteMgt(int mngNo);
	*/
	public int mngInsert(Manager m);
	
	/* Manager Search*/
	public ArrayList<Manager> mngKeySearch(Search search);
	

}
