package com.kh.honeypoint.admin.rstrnt.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Search;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.member.model.service.MemberService;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;
import com.kh.honeypoint.admin.rstrnt.model.dao.RstrntMgtDao;
import com.kh.honeypoint.admin.rstrnt.model.vo.RstrntMgt;

@Service("rstMService")
public class RstrntMgtServiceImpl implements RstrntMgtService{
	@Autowired
	private RstrntMgtDao rstMDao;
	
	/* LIST UP */
	@Override
	public int rstrntAllCount() {
		return rstMDao.rstrntAllCount();
	}

	@Override
	public ArrayList<RstrntMgt> rstrntAll(PageInfo pi) {
		return rstMDao.rstrntAll(pi);
	}
	
	@Override
	public int deleteRstMgt(int rNo) {
		return rstMDao.deleteRstMgt(rNo);
	}	
	
	/* SEARCH */
	@Override
	public int rstKeySearchCount(SearchPaging sp) {
		return rstMDao.rstKeySearchCount(sp);
	}

	@Override
	public ArrayList<RstrntMgt> rstKeySearch(SearchPaging sp) {
		return rstMDao.rstKeySearch(sp);
	}
	
	
	
	
	
	
	
	
	@Override
	public int rstrntRegistCount() {
		return rstMDao.rstrntRegistCount();
	}

	@Override
	public ArrayList<RstrntMgt> rstrntRegist(PageInfo pi) {
		return rstMDao.rstrntRegist(pi);
	}
	
	@Override
	public int insertRstMgt(int rNo) {
		return rstMDao.insertRstMgt(rNo);
	}

	@Override
	public int jestctRstMgt(int rNo) {
		return rstMDao.jestctRstMgt(rNo);
	}
	
	
	@Override
	public int rstrntRejectCount() {
		return rstMDao.rstrntRejectCount();
	}

	@Override
	public ArrayList<RstrntMgt> rstrntReject(PageInfo pi) {
		return rstMDao.rstrntReject(pi);
	}




}
