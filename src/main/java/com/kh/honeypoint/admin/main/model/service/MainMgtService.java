package com.kh.honeypoint.admin.main.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.main.model.vo.MainMgt;

public interface MainMgtService {
	
	public ArrayList<MainMgt> mainMgtListup();
	public ArrayList<MainMgt> mainMgtListup2();
	public ArrayList<MainMgt> mainMgtListup3();
	/*
	public ArrayList<MainMgt> count();
	public ArrayList<MainMgt> count2();
	public ArrayList<MainMgt> count3();
	public ArrayList<MainMgt> count4();
	*/

	public String count();
	public String count2();
	public String count3();
	public String count4();
	
	public String loginC();
	public String selectMngPosition(int getmNo);
	
}
