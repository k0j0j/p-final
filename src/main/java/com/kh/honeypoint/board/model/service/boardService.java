package com.kh.honeypoint.board.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.board.model.vo.Board;
import com.kh.honeypoint.board.model.vo.BoardFile;
import com.kh.honeypoint.board.model.vo.PageInfo;

public interface boardService {

	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	Board selectBoard(int bNo, boolean flag);

	int selectTabListCount(String bType);

	ArrayList<Board> selectTabList(PageInfo pi, String bType);

	int insertBoard(Board b);

	int insertBImg(String originFileList, String renameFileList);

	ArrayList<BoardFile> selectBoardImgList(int bNo);



}
