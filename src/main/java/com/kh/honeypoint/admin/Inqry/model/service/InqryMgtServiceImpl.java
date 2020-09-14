package com.kh.honeypoint.admin.Inqry.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.admin.Inqry.model.dao.InqryMgtDao;
import com.kh.honeypoint.admin.Inqry.model.vo.InqryMgt;
import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.reportMgt.model.vo.Report;

@Service("inqMService")
public class InqryMgtServiceImpl implements InqryMgtService{
	@Autowired
	private InqryMgtDao inqMDao;

	/* LIST */
	@Override
	public int selectListCount() {
		return inqMDao.selectListCount();
	}

	@Override
	public ArrayList<InqryMgt> InqryMgtList(PageInfo pi) {
		return inqMDao.InqryMgtList(pi);
	}
	
	
	
	
	
	/* MEMBER LIST */
	@Override
	public int InqryMgtMCount() {
		return inqMDao.InqryMgtMCount();
	}

	@Override
	public ArrayList<InqryMgt> InqryMgtM(PageInfo pi) {
		return inqMDao.InqryMgtM(pi);
	}
	
	
	
	
	
	/* RSTRNT LIST */
	@Override
	public int InqryMgtRCount() {
		return inqMDao.InqryMgtRCount();
	}

	@Override
	public ArrayList<InqryMgt> InqryMgtR(PageInfo pi) {
		return inqMDao.InqryMgtR(pi);
	}
	
	
	
	
	
	/* SEARCH */
	@Override
	public int InqryMgtListSearchCount(SearchPaging sp) {
		return inqMDao.InqryMgtListSearchCount(sp);
	}

	@Override
	public ArrayList<InqryMgt> InqryMgtListSearch(SearchPaging sp) {
		return inqMDao.InqryMgtListSearch(sp);
	}
}
