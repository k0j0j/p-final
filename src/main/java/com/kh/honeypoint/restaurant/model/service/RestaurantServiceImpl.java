package com.kh.honeypoint.restaurant.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.restaurant.model.dao.RestaurantDao;
import com.kh.honeypoint.restaurant.model.vo.Photofile;
import com.kh.honeypoint.restaurant.model.vo.Restaurant;
import com.kh.honeypoint.restaurant.model.vo.RstrntMenu;

@Service("rService")
public class RestaurantServiceImpl implements RestaurantService{
	@Autowired
	private RestaurantDao rDao;
	
	@Override
	public Restaurant selectRestaurant(int rNo, boolean flag) {
		if(!flag) {
			rDao.addReadCount(rNo);
		}
		return rDao.selectRestaurant(rNo);
	}

	@Override
	public int selectImgListCount(int rNo) {
		
		return rDao.selectImgListCount(rNo);
	}

	@Override
	public ArrayList<Photofile> selectImgList(int rNo) {
		return rDao.selectImgList(rNo);
	}

	@Override
	public ArrayList<RstrntMenu> selectMenuList(int rNo) {
		return rDao.selectMenuList(rNo);
	}

}
