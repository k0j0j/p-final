package com.kh.honeypoint.admin.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.member.model.dao.MemberDao;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;
import com.kh.honeypoint.admin.member.model.vo.Search;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mDao;

	/* Member List */
	@Override
	public int selectListCount() {
		return mDao.selectListCount();
	}

	@Override
	public ArrayList<MemberMgt> selectList(PageInfo pi) {
		return mDao.selectList(pi);
	}

	/* MemberSecsn List */
	@Override
	public int memberSecsnListCount() {
		return mDao.memberSecsnListCount();
	}
	
	@Override
	public ArrayList<MemberMgt> memberSecsnList(PageInfo pi) {
		return mDao.memberSecsnList(pi);
	}

	@Override
	public int deleteMemberMgt(int mNo) {
		return mDao.deleteMemberMgt(mNo);
	}

	/* Member Searsh */
	/*	
	@Override
	public ArrayList<MemberMgt> searchMemMgt(Search search) {
		return mDao.searchMemMgt(search);
	}
	*//*
	@Override
	public int searchMemMgt(String mName) {
		return mDao.searchMemMgt(mName);
	}
	*/



	

}
