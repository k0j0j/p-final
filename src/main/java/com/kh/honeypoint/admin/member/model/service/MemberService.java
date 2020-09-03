package com.kh.honeypoint.admin.member.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;

public interface MemberService {

	public int selectListCount();
	
	public ArrayList<MemberMgt> selectList(PageInfo pi);
	
	
}
