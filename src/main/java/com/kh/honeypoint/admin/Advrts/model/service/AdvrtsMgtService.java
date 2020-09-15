package com.kh.honeypoint.admin.Advrts.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.Advrts.model.vo.AdvrtsMgt;
import com.kh.honeypoint.admin.common.PageInfo;

public interface AdvrtsMgtService {

	/* ADVRTS LIST */
	public int AdvrtsListCount();
	public ArrayList<AdvrtsMgt> AdvrtsList(PageInfo pi);
	
	public int advrtsIn(int bNo);
	public int advrtsDel(int bNo);
	
	public int advrtsDe(int bNo);
	
	
	
	
	/* INSERT ADVRTS LIST */
	public int AdvrtsIListCount();
	public ArrayList<AdvrtsMgt> AdvrtsIList(PageInfo pi);

	public int advrtsOff(int bNo);
	
	
	
	
	/* DELETE ADVRTS LIST */
	public int advrtsDListCount();
	public ArrayList<AdvrtsMgt> advrtsDList(PageInfo pi);
	
	
}
