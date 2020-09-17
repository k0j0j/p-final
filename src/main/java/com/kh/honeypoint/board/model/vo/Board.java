package com.kh.honeypoint.board.model.vo;

import java.util.Date;

public class Board {
	private int bNo;
	private int mNo;
	private String bType;
	private String bCategory;
	private String bTitle;
	private String bContent;
	private Date bEnrollDate;
	private Date bModifyDate;
	private int bCount;
	private char bStatus;
	
	public Board() {}

	public Board(int bNo, int mNo, String bType, String bCategory, String bTitle, String bContent, Date bEnrollDate,
			Date bModifyDate, int bCount, char bStatus) {
		super();
		this.bNo = bNo;
		this.mNo = mNo;
		this.bType = bType;
		this.bCategory = bCategory;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bEnrollDate = bEnrollDate;
		this.bModifyDate = bModifyDate;
		this.bCount = bCount;
		this.bStatus = bStatus;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public String getbCategory() {
		return bCategory;
	}

	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbEnrollDate() {
		return bEnrollDate;
	}

	public void setbEnrollDate(Date bEnrollDate) {
		this.bEnrollDate = bEnrollDate;
	}

	public Date getbModifyDate() {
		return bModifyDate;
	}

	public void setbModifyDate(Date bModifyDate) {
		this.bModifyDate = bModifyDate;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public char getbStatus() {
		return bStatus;
	}

	public void setbStatus(char bStatus) {
		this.bStatus = bStatus;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", mNo=" + mNo + ", bType=" + bType + ", bCategory=" + bCategory + ", bTitle="
				+ bTitle + ", bContent=" + bContent + ", bEnrollDate=" + bEnrollDate + ", bModifyDate=" + bModifyDate
				+ ", bCount=" + bCount + ", bStatus=" + bStatus + "]";
	}
	
	
}
