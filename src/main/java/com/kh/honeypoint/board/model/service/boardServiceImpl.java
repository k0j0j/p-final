package com.kh.honeypoint.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.honeypoint.board.model.dao.boardDao;
import com.kh.honeypoint.board.model.vo.Board;
import com.kh.honeypoint.board.model.vo.BoardFile;
import com.kh.honeypoint.board.model.vo.PageInfo;

@Service("bService")
public class boardServiceImpl implements boardService{
	@Autowired
	private boardDao bDao;
	
	@Override
	public int selectListCount() {
		return bDao.selectListCount();
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDao.selectList(pi);
	}

	@Override
	public Board selectBoard(int bNo, boolean flag) {
		// 조회수 증가 처리
		if(!flag) {
			bDao.addReadCount(bNo);
		}
		// insert 시 에러가 발생하도록 유도함
		// 에러 발생시 rollback 적용이 되어야 하므로
		// 조회수 0인 게시글을 클릭하더라도 조회수는 증가하지 말아야함
		// bDao.insertBoard(new Board());
		
		// 게시글 조회
		return bDao.selectBoard(bNo);
	}

	@Override
	public int selectTabListCount(String bType) {
		return bDao.selectTabListCount(bType);
	}

	@Override
	public ArrayList<Board> selectTabList(PageInfo pi, String bType) {
		return bDao.selectList(pi, bType);
	}

	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(b);
	}

	@Override
	public int insertBImg(String originFileList, String renameFileList) {
		return bDao.insertBImg(originFileList,renameFileList);
	}


	@Override
	public ArrayList<BoardFile> selectBoardImgList(int bNo) {
		return bDao.selectBoardImgList(bNo);
	}



}
