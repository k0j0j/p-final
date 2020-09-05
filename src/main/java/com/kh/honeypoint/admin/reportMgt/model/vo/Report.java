package com.kh.honeypoint.admin.reportMgt.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Report {
	
	/* TB_REPORT */
	private int prtNo;			// NO 신고 고유번호
	private String mId;			// 신고 회원

	private int rptCatNo;		// 카테고리 번호
	private int targetCategory;	// 1. 리뷰 2. 게시글 3. 댓글
	
	private String targetId;	// 피신고인
	private int targetNo;		// 피신고인

	private Date rptDate;		// 신고 일자
	private char rptResult;		// 처리결과
	private int rptRef;			// 신고 게시글, 댓글, 리뷰 번호
	private String rptResnEtc;	// 신고 사유
	
	/* TB_REPORT_RESN */
	private String rptResn;		// 구분 신고 카테고리명	
	
	/* TB_REPORT_SORT */
	private int mSortNo;
	private String mSortCn;
}
