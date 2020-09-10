package com.kh.honeypoint.admin.member.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.member.model.vo.MemberMgt;
import com.kh.honeypoint.admin.member.model.vo.Search;

public interface MemberService {

	/* Member */
	public int selectListCount();
	public ArrayList<MemberMgt> selectList(PageInfo pi);
	
	/* Member_Secsn */
	public int memberSecsnListCount();
	public ArrayList<MemberMgt> memberSecsnList(PageInfo pi);
	
	/* Member Delete*/
	public int deleteMemberMgt(int mNo);
	
	/* Member Search */
	public ArrayList<MemberMgt> memKeySearch(Search search);

	
	
	
	
	
	/* MANAGER DELETE*/
	public int deleteMgt(int mngNo);

}