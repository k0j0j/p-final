package com.kh.honeypoint.restaurant.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.restaurant.model.dao.RestaurantDao;
import com.kh.honeypoint.restaurant.model.vo.Restaurant;

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

}
