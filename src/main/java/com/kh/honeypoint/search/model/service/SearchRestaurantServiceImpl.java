package com.kh.honeypoint.search.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.search.model.dao.SearchRestaurantDao;
import com.kh.honeypoint.search.model.vo.PageInfo;
import com.kh.honeypoint.search.model.vo.Search;
import com.kh.honeypoint.search.model.vo.Restaurant;



@Service("sService")
public class SearchRestaurantServiceImpl implements SearchRestaurantService{
	@Autowired
	private SearchRestaurantDao sDao;
	

	@Override
	public ArrayList<Restaurant> searchList(Search search, PageInfo pi) {
		return sDao.searchList(search, pi);
	}

	@Override
	public int selectListCount(Search search) {
		
		return sDao.selectListCount(search);
	}


}
