package com.kh.honeypoint.admin.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.member.model.dao.MemberDao;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mDao;

	@Override
	public int selectListCount() {
		return mDao.selectListCount();
	}

	@Override
	public ArrayList<MemberMgt> selectList(PageInfo pi) {

		return mDao.selectListCount(pi);
	}
	

}
