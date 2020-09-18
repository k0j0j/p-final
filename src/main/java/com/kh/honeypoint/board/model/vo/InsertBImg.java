package com.kh.honeypoint.board.model.vo;

import java.util.ArrayList;

public class InsertBImg {
	private ArrayList<String> originFileList;
	private ArrayList<String> renameFileList;
	private int bNo;
	
	public InsertBImg() {}

	public InsertBImg(ArrayList<String> originFileList, ArrayList<String> renameFileList, int bNo) {
		super();
		this.originFileList = originFileList;
		this.renameFileList = renameFileList;
		this.bNo = bNo;
	}

	public ArrayList<String> getOriginFileList() {
		return originFileList;
	}

	public void setOriginFileList(ArrayList<String> originFileList) {
		this.originFileList = originFileList;
	}

	public ArrayList<String> getRenameFileList() {
		return renameFileList;
	}

	public void setRenameFileList(ArrayList<String> renameFileList) {
		this.renameFileList = renameFileList;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	@Override
	public String toString() {
		return "InsertBImg [originFileList=" + originFileList + ", renameFileList=" + renameFileList + ", bNo=" + bNo
				+ "]";
	}
	
	
	
}
