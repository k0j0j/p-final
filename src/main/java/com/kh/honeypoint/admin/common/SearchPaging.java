package com.kh.honeypoint.admin.common;

import org.apache.ibatis.session.RowBounds;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SearchPaging {

	/* PageInfo */		
	private int currentPage;	// 현재 페이지
	private int listCount;		// 전체 게시글
	private int pageLimit;		// 한 페이지에 보여질 글 수
	
	private int maxPage;		// 마지막 페이지
	private int startPage;		// 시작 페이지
	private int endPage;		// 마지막 페이지
	
	private int boardLimit;
		
	/* Search */
	private String searchCondition;
	private String searchValue;
	
	private String selectBtn;
	
	/* */
	private RowBounds rowbounds;
	
	public SearchPaging(int currentPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
			int boardLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.boardLimit = boardLimit;
	}

	public SearchPaging(int currentPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
			int boardLimit, String searchCondition) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.boardLimit = boardLimit;
		this.searchCondition = searchCondition;
	}
	
	
	

}
