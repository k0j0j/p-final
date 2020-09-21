package com.kh.honeypoint.board.model.vo;

import java.util.Date;

public class Comment {
	private int cmtNo;
	private int mNo;
	private String mId;
	private String mNickname;
	private int bNo;
	private String cmtContent;
	private Date cmtEnrollDate;
	private Date cmtModifyDate;
	private char cmtStatus;

	public Comment() {}

	public Comment(int cmtNo, int mNo, String mId, String mNickname, int bNo, String cmtContent, Date cmtEnrollDate,
			Date cmtModifyDate, char cmtStatus) {
		super();
		this.cmtNo = cmtNo;
		this.mNo = mNo;
		this.mId = mId;
		this.mNickname = mNickname;
		this.bNo = bNo;
		this.cmtContent = cmtContent;
		this.cmtEnrollDate = cmtEnrollDate;
		this.cmtModifyDate = cmtModifyDate;
		this.cmtStatus = cmtStatus;
	}

	public int getCmtNo() {
		return cmtNo;
	}

	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getCmtContent() {
		return cmtContent;
	}

	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}

	public Date getCmtEnrollDate() {
		return cmtEnrollDate;
	}

	public void setCmtEnrollDate(Date cmtEnrollDate) {
		this.cmtEnrollDate = cmtEnrollDate;
	}

	public Date getCmtModifyDate() {
		return cmtModifyDate;
	}

	public void setCmtModifyDate(Date cmtModifyDate) {
		this.cmtModifyDate = cmtModifyDate;
	}

	public char getCmtStatus() {
		return cmtStatus;
	}

	public void setCmtStatus(char cmtStatus) {
		this.cmtStatus = cmtStatus;
	}

	@Override
	public String toString() {
		return "Comment [cmtNo=" + cmtNo + ", mNo=" + mNo + ", mId=" + mId + ", mNickname=" + mNickname + ", bNo=" + bNo
				+ ", cmtContent=" + cmtContent + ", cmtEnrollDate=" + cmtEnrollDate + ", cmtModifyDate=" + cmtModifyDate
				+ ", cmtStatus=" + cmtStatus + "]";
	}

	
}
