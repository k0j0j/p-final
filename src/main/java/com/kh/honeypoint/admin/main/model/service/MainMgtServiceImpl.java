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

	
	
	
	
	@Override
	public ArrayList<MainMgt> mCounting() {
		return mainMDao.mCounting();
	}

	@Override
	public ArrayList<MainMgt> rtCounting() {
		return mainMDao.rtCounting();
	}

	@Override
	public ArrayList<MainMgt> reCounting() {
		return mainMDao.reCounting();
	}
	

	
}
