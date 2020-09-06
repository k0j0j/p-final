package com.kh.honeypoint.admin.manager.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.manager.model.dao.ManagerDao;
import com.kh.honeypoint.admin.manager.model.vo.Manager;

@Service("mngService")
public class ManagerServiceImpl implements ManagerService{
 	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private ManagerDao mngDao;
	
	@Override
	public int idCheck(String mngId) {
		System.out.println("ServiceId: " + mngId);		
		return mngDao.idCheck(mngId);
	}

	/* MANAGER LIST */
	@Override
	public int selectMngCount() {
		return mngDao.selectMngCount();
	}

	@Override
	public ArrayList<Manager> selectMng(PageInfo pi) {
		return mngDao.selectMng(pi);
	}
}
