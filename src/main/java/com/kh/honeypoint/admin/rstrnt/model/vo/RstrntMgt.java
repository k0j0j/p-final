package com.kh.honeypoint.admin.rstrnt.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RstrntMgt {

	private int rNo;			// 업체회원번호
	private int mNo;			// 회원번호
	private String rTel;		// 업체 전화번호
	private String rType;		// 업종 카테고리
	private String rName;		// 업체명
	
	private String rAddress;	// 업체주소
	private String rOAddress;	// 지번주소
	private String rTag;		// 검색 태그
	private int rPrice;			// 가격대
	private char rParking;		// 주차
	private String rStartTime;	// 영업시작시간
	private String rEndTime;	// 영업종료시간
	
	private int rRating;			// 평점
	private String rIntro;		// 맛집 소개
	private char resveYn;		
	private String rRestDay;	// 정기휴무일
	private char rStatus;		// 맛집 삭제여부
	
	private int rCount;			// 조회수
	
	/* TB_R_RETURN*/
	private String rReturnCn;
	private Date rReturnDate;
	
	private String mName;
	
}
