package com.kh.honeypoint.board.model.vo;

public class Search {
	private String searchCondition;
	private String searchValue;
	private int bType;
	
	public Search() {}

	public Search(String searchCondition, String searchValue, int bType) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.bType = bType;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", bType=" + bType + "]";
	}

	
	
}
