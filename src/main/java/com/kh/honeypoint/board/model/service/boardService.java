package com.kh.honeypoint.board.model.service;

import java.util.ArrayList;

import com.kh.honeypoint.board.model.vo.Board;
import com.kh.honeypoint.board.model.vo.BoardFile;
import com.kh.honeypoint.board.model.vo.Comment;
import com.kh.honeypoint.board.model.vo.PageInfo;
import com.kh.honeypoint.board.model.vo.Search;

public interface boardService {

	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	Board selectBoard(int bNo, boolean flag);

	int selectTabListCount(String bType);

	ArrayList<Board> selectTabList(PageInfo pi, String bType);

	int insertBoard(Board b);

	int insertBImg(String originFileList, String renameFileList);

	ArrayList<BoardFile> selectBoardImgList(int bNo);

	ArrayList<Comment> selectCmtList(int bNo);

	int insertCmt(Comment c);

	int deleteBoard(int bNo);

	ArrayList<String> getBoardImgNames(int bNo);

	int deleteBoardImage(String string);

	int updateBoard(Board b);

	Comment selectCmt(int cmtNo);

	int deleteCmt(int cmtNo);

	int updateBImg(String originFileList, String renameFileList, int bNo);

	int updateCmt(Comment c);

	ArrayList<Board> searchList(Search search);


}
