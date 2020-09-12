package com.kh.honeypoint.search.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.search.model.vo.PageInfo;
import com.kh.honeypoint.search.model.vo.Search;
import com.kh.honeypoint.search.model.vo.Restaurant;

public interface SearchRestaurantService {

	public ArrayList<Restaurant> searchList(Search search, PageInfo pi);
  
	public int selectListCount(Search search);

}
