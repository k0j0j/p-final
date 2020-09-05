package com.kh.honeypoint.restaurant.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.restaurant.model.vo.Photofile;
import com.kh.honeypoint.restaurant.model.vo.Restaurant;
import com.kh.honeypoint.restaurant.model.vo.RstrntMenu;

public interface RestaurantService {

	Restaurant selectRestaurant(int rNo, boolean flag);

	int selectImgListCount(int rNo);

	ArrayList<Photofile> selectImgList(int rNo);

	ArrayList<RstrntMenu> selectMenuList(int rNo);

}
