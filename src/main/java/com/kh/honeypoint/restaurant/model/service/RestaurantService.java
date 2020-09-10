package com.kh.honeypoint.restaurant.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.honeypoint.restaurant.model.vo.InsertReviewImg;
import com.kh.honeypoint.restaurant.model.vo.Photofile;
import com.kh.honeypoint.restaurant.model.vo.Restaurant;
import com.kh.honeypoint.restaurant.model.vo.Review;
import com.kh.honeypoint.restaurant.model.vo.ReviewCount;
import com.kh.honeypoint.restaurant.model.vo.ReviewImg;
import com.kh.honeypoint.restaurant.model.vo.RstrntMenu;

public interface RestaurantService {

	Restaurant selectRestaurant(int rNo, boolean flag);

	int selectImgListCount(int rNo);

	ArrayList<Photofile> selectImgList(int rNo);

	ArrayList<RstrntMenu> selectMenuList(int rNo);

	ArrayList<Review> selectReviewList(HashMap<String, Integer> value);

	ReviewCount selectReviewCount(int rNo);

	ArrayList<ReviewImg> selectReviewImgList(HashMap<String, Integer> value);

	ArrayList<Review> selectReviewFilterList(HashMap<String, Integer> value);

	int insertReview(Review rev);

	int insertReviewImg(InsertReviewImg value);

}
