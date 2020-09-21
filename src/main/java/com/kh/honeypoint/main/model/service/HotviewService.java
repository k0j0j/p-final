package com.kh.honeypoint.main.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.admin.Advrts.model.vo.AdvrtsMgt;
import com.kh.honeypoint.search.model.vo.Restaurant;



public interface HotviewService {
	public ArrayList<Restaurant> mainList();

	public ArrayList<Restaurant> main2List();

	public ArrayList<Restaurant> cafeList();

	public ArrayList<Restaurant> italianList();

	public ArrayList<Restaurant> pubList();

	public ArrayList<AdvrtsMgt> advList();
	
	
}
