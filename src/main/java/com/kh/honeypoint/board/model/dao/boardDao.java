package com.kh.honeypoint.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.board.model.vo.Board;
import com.kh.honeypoint.board.model.vo.BoardFile;
import com.kh.honeypoint.board.model.vo.Comment;
import com.kh.honeypoint.board.model.vo.PageInfo;
import com.kh.honeypoint.board.model.vo.Search;
import com.kh.honeypoint.member.model.vo.Photofile;
import com.kh.honeypoint.restaurant.model.vo.ReviewImg;


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

	public void addReadCount(int bNo) {
		sqlSession.update("boardMapper.updateCount", bNo);
	}

	public Board selectBoard(int bNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", bNo);
	}

	public int selectTabListCount(String bType) {
		return sqlSession.selectOne("boardMapper.selectTabListCount", bType);
	}

	public ArrayList<Board> selectList(PageInfo pi, String bType) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectTabList", bType , rowBounds);
	}
	
	public int insertBoard(Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}



	public int insertBImg(String originFileList, String renameFileList) {
		BoardFile value = new BoardFile();
		value.setOriginFileName(originFileList);
		value.setStreFileName(renameFileList);
		return sqlSession.insert("boardMapper.insertBImg", value);
	}


	public ArrayList<BoardFile> selectBoardImgList(int bNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardImgList", bNo);
	}

	public ArrayList<Comment> selectCmtImgList(int bNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectCmtList", bNo);
	}

	public int insertCmt(Comment c) {
		return sqlSession.insert("boardMapper.insertCmt", c);
	}

	public int deleteBoard(int bNo) {
		return sqlSession.delete("boardMapper.deleteBoard", bNo);
	}

	public ArrayList<String> getBoardImgNames(int bNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.getBoardImgNames", bNo);
	}

	public int deleteBoardImage(String string) {
		return sqlSession.delete("boardMapper.deleteBoardImage", string);
	}

	public int updateBoard(Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public Comment selectCmt(int cmtNo) {
		return sqlSession.selectOne("boardMapper.selectCmt", cmtNo);
	}

	public int deleteCmt(int cmtNo) {
		return sqlSession.delete("boardMapper.deleteCmt", cmtNo);
	}
	public int updateBImg(String originFileList, String renameFileList, int bNo) {
		BoardFile value = new BoardFile();
		value.setbNo(bNo);
		value.setOriginFileName(originFileList);
		value.setStreFileName(renameFileList);
		return sqlSession.insert("boardMapper.updateBImg", value);
	}

	public int updateCmt(Comment c) {
		return sqlSession.update("boardMapper.updateCmt", c);
	}

	public ArrayList<Board> searchList(Search search) {
		return (ArrayList)sqlSession.selectList("boardMapper.searchList", search);
	}
}
