package com.kh.honeypoint.admin.main.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.admin.main.model.dao.MainMgtDao;
import com.kh.honeypoint.admin.main.model.vo.MainMgt;

@Service("mainMService")
public class MainMgtServiceImpl implements MainMgtService{
	@Autowired
	private MainMgtDao mainMDao;
	
	@Override
	public ArrayList<MainMgt> mainMgtListup() {
		return mainMDao.mainMgtListup();
	}

	@Override
	public ArrayList<MainMgt> mainMgtListup2() {
		return mainMDao.mainMgtListup2();
	}

	@Override
	public ArrayList<MainMgt> mainMgtListup3() {
		return mainMDao.mainMgtListup3();
	}

	

	
	
	/*
	@Override
	public ArrayList<MainMgt> count() {
		return mainMDao.count();
	}

	@Override
	public ArrayList<MainMgt> count2() {
		return mainMDao.count2();
	}

	@Override
	public ArrayList<MainMgt> count3() {
		return mainMDao.count3();
	}
	
	@Override
	public ArrayList<MainMgt> count4() {
		return mainMDao.count4();
	}
	*/

	
	

	
	
	@Override
	public String count() {
		return mainMDao.count();
	}

	@Override
	public String count2() {
		return mainMDao.count2();
	}

	@Override
	public String count3() {
		return mainMDao.count3();
	}

	@Override
	public String count4() {
		return mainMDao.count4();
	}

	@Override
	public String loginC() {
		return mainMDao.loginC();
	}	
	
	public String selectMngPosition(int getmNo) {
		return mainMDao.selectMngPosition(getmNo);
	}
}
