package com.kh.honeypoint.restaurant.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.restaurant.model.vo.Photofile;
import com.kh.honeypoint.restaurant.model.vo.Restaurant;

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

}
