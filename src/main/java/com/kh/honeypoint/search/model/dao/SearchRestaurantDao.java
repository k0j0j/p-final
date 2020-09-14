package com.kh.honeypoint.search.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.search.model.vo.PageInfo;
import com.kh.honeypoint.search.model.vo.Search;
import com.kh.honeypoint.search.model.vo.Restaurant;



@Repository("sDao")
public class SearchRestaurantDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Restaurant> searchList(Search search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("restaurantMapper.selectList", search, rowBounds);
	}

	public int selectListCount(Search search) {

		return sqlSession.selectOne("restaurantMapper.selectListCount", search);
	}

	
}
