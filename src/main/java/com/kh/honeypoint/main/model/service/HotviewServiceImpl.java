package com.kh.honeypoint.main.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.admin.Advrts.model.vo.AdvrtsMgt;
import com.kh.honeypoint.main.model.dao.HotviewDao;
import com.kh.honeypoint.search.model.vo.Restaurant;



@Service("hotviewService")
public class HotviewServiceImpl implements HotviewService{
	@Autowired
	private HotviewDao hotviewDao;


	@Override
	public ArrayList<Restaurant> mainList() {

		return hotviewDao.mainList();
	}
	
	@Override
	public ArrayList<Restaurant> main2List() {

		return hotviewDao.main2List();
	}

	@Override
	public ArrayList<Restaurant> cafeList() {

		return hotviewDao.cafeList();
	}

	@Override
	public ArrayList<Restaurant> italianList() {

		return hotviewDao.italianList();
	}

	@Override
	public ArrayList<Restaurant> pubList() {

		return hotviewDao.pubList();
	}

	@Override
	public ArrayList<AdvrtsMgt> advList() {

		return hotviewDao.advList();
	}

}
