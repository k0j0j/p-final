package com.kh.honeypoint.admin.main.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.honeypoint.admin.main.model.vo.MainMgt;

public interface MainMgtService {
	
	public ArrayList<MainMgt> mainMgtListup();
	public ArrayList<MainMgt> mainMgtListup2();
	public ArrayList<MainMgt> mainMgtListup3();
	
	public ArrayList<MainMgt> mCounting();
	public ArrayList<MainMgt> rtCounting();
	public ArrayList<MainMgt> reCounting();
}
