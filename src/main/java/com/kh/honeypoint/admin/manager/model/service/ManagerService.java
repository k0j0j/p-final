package com.kh.honeypoint.admin.manager.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.manager.model.vo.Manager;

public interface ManagerService {
	
	public int idCheck(String mngId);
	
	public int selectMngCount();
	public ArrayList<Manager> selectMng(PageInfo pi);
	

}
