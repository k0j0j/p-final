package com.kh.honeypoint.admin.Advrts.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.admin.Advrts.model.dao.AdvrtsMgtDao;
import com.kh.honeypoint.admin.Advrts.model.vo.AdvrtsMgt;
import com.kh.honeypoint.admin.common.PageInfo;

@Service("adMService")
public class AdvrtsMgtServiceImpl implements AdvrtsMgtService{
	@Autowired
	private AdvrtsMgtDao adMDao;
	
	@Override
	public int AdvrtsListCount() {
		return adMDao.AdvrtsListCount();
	}
	@Override
	public ArrayList<AdvrtsMgt> AdvrtsList(PageInfo pi) {
		return adMDao.AdvrtsList(pi);
	}

	
	@Override
	public int advrtsIn(int bNo) {
		return adMDao.advrtsIn(bNo);
	}
	@Override
	public int advrtsDel(int bNo) {
		return adMDao.advrtsDel(bNo);
	}
	
	
	
	
	@Override
	public int AdvrtsIListCount() {
		return adMDao.AdvrtsIListCount();
	}

	@Override
	public ArrayList<AdvrtsMgt> AdvrtsIList(PageInfo pi) {
		return adMDao.AdvrtsIList(pi);
	}

	@Override
	public int advrtsOff(int bNo) {
		return adMDao.advrtsOff(bNo);
	}
	
	
	
	
	
	@Override
	public int advrtsDListCount() {
		return adMDao.advrtsDListCount();
	}

	@Override
	public ArrayList<AdvrtsMgt> advrtsDList(PageInfo pi) {
		return adMDao.advrtsDList(pi);
	}



}
