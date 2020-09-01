package com.kh.honeypoint.restaurant.model.service;

import com.kh.honeypoint.restaurant.model.vo.Restaurant;

public interface RestaurantService {

	Restaurant selectRestaurant(int rNo, boolean flag);

}
