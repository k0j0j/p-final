package com.kh.honeypoint.restaurant.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.restaurant.model.vo.Photofile;
import com.kh.honeypoint.restaurant.model.vo.Restaurant;
import com.kh.honeypoint.restaurant.model.vo.Review;
import com.kh.honeypoint.restaurant.model.vo.RstrntMenu;

@Repository("rDao")
public class RestaurantDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void addReadCount(int rNo) {
		sqlSession.update("restaurantMapper.updateCount", rNo);
		
	}

	public Restaurant selectRestaurant(int rNo) {
		return sqlSession.selectOne("restaurantMapper.selectOne", rNo);
	}

	public int selectImgListCount(int rNo) {
		return sqlSession.selectOne("restaurantMapper.selectImgListCount", rNo);
	}

	public ArrayList<Photofile> selectImgList(int rNo) {
		return (ArrayList)sqlSession.selectList("restaurantMapper.selectImgList", rNo);
	}

	public ArrayList<RstrntMenu> selectMenuList(int rNo) {
		return (ArrayList)sqlSession.selectList("restaurantMapper.selectMenuList", rNo);
	}

	public ArrayList<Review> selectReviewList(HashMap<String, Integer> value) {
		int offset = (value.get("startNum") - 1) * 5;
		RowBounds rowBounds = new RowBounds(offset, 5);
		System.out.println(offset);
		System.out.println(value);
		return (ArrayList)sqlSession.selectList("restaurantMapper.selectReviewList", value, rowBounds);
	}

}
