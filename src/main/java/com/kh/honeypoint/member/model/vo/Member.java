package com.kh.honeypoint.member.model.vo;

import java.sql.Date;

public class Member {
	private int mNo;
	private String mId;
	private String mName;
	private String mEmail;
	private Date mEnrollDate;
	private Date mModifyDate;
	private char mStatus;
	private char rConf;
	private String mOriginPf;
	private String mStrePf;
	
	public Member(int mNo, String mId, String mName, String mEmail, Date mEnrollDate, Date mModifyDate, char mStatus,
			char rConf, String mOriginPf, String mStrePf) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mName = mName;
		this.mEmail = mEmail;
		this.mEnrollDate = mEnrollDate;
		this.mModifyDate = mModifyDate;
		this.mStatus = mStatus;
		this.rConf = rConf;
		this.mOriginPf = mOriginPf;
		this.mStrePf = mStrePf;
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

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public Date getmEnrollDate() {
		return mEnrollDate;
	}

	public void setmEnrollDate(Date mEnrollDate) {
		this.mEnrollDate = mEnrollDate;
	}

	public Date getmModifyDate() {
		return mModifyDate;
	}

	public void setmModifyDate(Date mModifyDate) {
		this.mModifyDate = mModifyDate;
	}

	public char getmStatus() {
		return mStatus;
	}

	public void setmStatus(char mStatus) {
		this.mStatus = mStatus;
	}

	public char getrConf() {
		return rConf;
	}

	public void setrConf(char rConf) {
		this.rConf = rConf;
	}

	public String getmOriginPf() {
		return mOriginPf;
	}

	public void setmOriginPf(String mOriginPf) {
		this.mOriginPf = mOriginPf;
	}

	public String getmStrePf() {
		return mStrePf;
	}

	public void setmStrePf(String mStrePf) {
		this.mStrePf = mStrePf;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mId=" + mId + ", mName=" + mName + ", mEmail=" + mEmail + ", mEnrollDate="
				+ mEnrollDate + ", mModifyDate=" + mModifyDate + ", mStatus=" + mStatus + ", rConf=" + rConf
				+ ", mOriginPf=" + mOriginPf + ", mStrePf=" + mStrePf + "]";
	}
	
	
	
}
