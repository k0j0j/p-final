package com.kh.honeypoint.admin.common;

import lombok.Data;

@Data
public class PageInfo {

	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	private int boardLimit;
	
	public PageInfo(int currentPage2, int listCount2, int pageLimit2, int maxPage2, int startPage2, int endPage2, int boardLimit2) {}
	
}
