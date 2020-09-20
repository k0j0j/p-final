package com.kh.honeypoint.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.search.model.vo.Restaurant;



@Repository("hotviewDao")
public class HotviewDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public ArrayList<Restaurant> mainList() {
		System.out.println("DAO     dddfdfsdfasdjlhjfladsljkafhdsjkahfdsjhafdshjlfdsalhjkfdahljkdfsahjklfadshjklafsdhjlfadsjhkl");
		
		return (ArrayList)sqlSession.selectList("mainMapper.hotviewList");
		
	}
	
	public ArrayList<Restaurant> main2List() {
		System.out.println("DAO     dddfdfsdfasdjlhjfladsljkafhdsjkahfdsjhafdshjlfdsalhjkfdahljkdfsahjklfadshjklafsdhjlfadsjhkl");
		
		return (ArrayList)sqlSession.selectList("mainMapper.scoreList");
		
	}

	public ArrayList<Restaurant> cafeList() {

		return (ArrayList)sqlSession.selectList("mainMapper.cafeList");
	}


}
