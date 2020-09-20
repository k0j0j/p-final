package com.kh.honeypoint.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.admin.Advrts.model.vo.AdvrtsMgt;
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

	public ArrayList<Restaurant> italianList() {

		return (ArrayList)sqlSession.selectList("mainMapper.italianList");
	}

	public ArrayList<Restaurant> pubList() {

		return (ArrayList)sqlSession.selectList("mainMapper.pubList");
	}

//	public ArrayList<AdvrtsMgt> advList() {
//
//		return (ArrayList)sqlSession.selectList("mainMapper.advList");
//	}


}
