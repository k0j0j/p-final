package com.kh.honeypoint.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.member.model.vo.InsertResImg;
import com.kh.honeypoint.member.model.vo.Member;
import com.kh.honeypoint.member.model.vo.Menu;
import com.kh.honeypoint.member.model.vo.Photofile;
import com.kh.honeypoint.member.model.vo.Restaurant;


@Repository("memDao")	 
public class memberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.memSort",m);
	}
	
	
	public int insertMember1(Member m1) {
		return sqlSession.insert("memberMapper.insertMember1", m1);
	}
	public int insertMember2(Member m2) {
		return sqlSession.insert("memberMapper.insertMember2", m2);
	}
	public int insertMember3(Member m3) {
		return sqlSession.insert("memberMapper.insertMember3", m3);
	}
	
	
	public int insertRes1(Restaurant r1) {
		return sqlSession.insert("memberMapper.insertRes1", r1);
	}
	public int insertRes2(Restaurant r2) {
		return sqlSession.insert("memberMapper.insertRes2", r2);
	}
	public int insertRes3(Restaurant r3) {
		return sqlSession.insert("memberMapper.insertRes3", r3);
	}

	
	public int checkIdDup(String mId) {
		return sqlSession.selectOne("memberMapper.idCheck", mId);
	}

	public int insertMenu(int rNo, String menuName, int menuPrice) {
		Menu menu = new Menu();
		menu.setrNo(rNo);
		menu.setMenuName(menuName);
		menu.setMenuPrice(menuPrice);
		return sqlSession.insert("memberMapper.insertMenu", menu);
	}


	public int insertResImg(int rNo, String originFileList, String renameFileList) {
		Photofile value = new Photofile();
		value.setrNo(rNo);
		value.setOriginFileName(originFileList);
		value.setStreFileName(renameFileList);
		return sqlSession.insert("memberMapper.insertResImg", value);
	}


	public int selectRno() {
		return sqlSession.selectOne("memberMapper.selectRno");
	}


	public int insertHistory(Member loginUser) {
		
		return sqlSession.insert("memberMapper.insertHistory", loginUser);
	}

	

}
