package com.kh.honeypoint.restaurant.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.restaurant.model.dao.RestaurantDao;
import com.kh.honeypoint.restaurant.model.vo.InsertReviewImg;
import com.kh.honeypoint.restaurant.model.vo.Photofile;
import com.kh.honeypoint.restaurant.model.vo.Restaurant;
import com.kh.honeypoint.restaurant.model.vo.Review;
import com.kh.honeypoint.restaurant.model.vo.ReviewCount;
import com.kh.honeypoint.restaurant.model.vo.ReviewImg;
import com.kh.honeypoint.restaurant.model.vo.RstrntMenu;
import com.kh.honeypoint.restaurant.model.vo.UpdateReviewImg;

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

	@Override
	public ArrayList<Review> selectReviewList(HashMap<String, Integer> value) {
		return rDao.selectReviewList(value);
	}

	@Override
	public ReviewCount selectReviewCount(int rNo) {
		return rDao.selectReviewCount(rNo);
	}

	@Override
	public ArrayList<ReviewImg> selectReviewImgList(HashMap<String, Integer> value) {
		return rDao.selectReviewImgList(value);
	}

	@Override
	public ArrayList<Review> selectReviewFilterList(HashMap<String, Integer> value) {
		return rDao.selectReviewFilterList(value);
	}

	@Override
	public int insertReview(Review rev) {
		return rDao.insertReview(rev);
	}

	@Override
	public int insertReviewImg(InsertReviewImg value) {
		return rDao.insertReviewImg(value);
	}

	@Override
	public Review selectReview(int rNo, int revNo) {
		return rDao.selectReview(rNo, revNo);
	}

	@Override
	public String deleteImgFile(ReviewImg revImg) {
		return rDao.deleteImgFile(revImg);
	}

	@Override
	public int deleteReviewImg(Review rev, String[] names) {
		return rDao.deleteReviewImg(rev, names);
	}

	@Override
	public int updateReviewImg(UpdateReviewImg value) {
		return rDao.updateReviewImg(value);
	}

	@Override
	public int updateReview(Review rev) {
		return rDao.updateReview(rev);
	}

	@Override
	public int deleteReviewImage(String name) {
		return rDao.deleteReviewImage(name);
	}



}
