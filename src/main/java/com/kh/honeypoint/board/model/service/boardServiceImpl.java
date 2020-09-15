package com.kh.honeypoint.board.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.honeypoint.board.model.vo.Board;
import com.kh.honeypoint.board.model.vo.PageInfo;

@Service("bService")
public class boardServiceImpl implements boardService{

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board selectBoard(int bNo, boolean flag) {
		// TODO Auto-generated method stub
		return null;
	}

}
