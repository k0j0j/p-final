package com.kh.honeypoint.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.board.model.vo.Board;
import com.kh.honeypoint.board.model.vo.PageInfo;


@Repository("bDao")
public class boardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectListCount() {
		return sqlSession.selectOne("boardMapper.selectListCount");
		
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		// 몇 개의 게시글을 건너 뛸 것인지
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null , rowBounds);
	}

	public int insertBoard(Board b) {
		System.out.println("다오 들어옴");
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public void addReadCount(int bNo) {
		sqlSession.update("boardMapper.updateCount", bNo);
	}

	public Board selectBoard(int bNo) {
		return sqlSession.selectOne("boardMapper.selectOne", bNo);
	}
}
