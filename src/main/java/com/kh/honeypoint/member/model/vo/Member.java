package com.kh.honeypoint.member.model.vo;

import java.sql.Date;

public class Member {
	private int mNo;
	private String mId;
	private String mPwd;
	private String mName;
	private String mNickname;
	private String mBirthday;
	private String mEmail;
	private String mPhone;
	private String mAddress;
	private Date mEnrollDate;
	private Date mModifyDate;
	private String mGrad;
	private int mPoint;
	private char mStatus;
	private int rConf;
	private String mOriginPf;
	private String mStrePf;
	
	private int mSortNo;
	
	// 포인트 조회
	private Date setleDe;
	private int stPrc;
	private String rName;
	private int rNo;
	
	public Member() {}
	
	
	
	public Member(int mNo, String mId, String mPwd, String mName, String mNickname, String mBirthday, String mEmail,
			String mPhone, String mAddress, Date mEnrollDate, Date mModifyDate, String mGrad, int mPoint, char mStatus,
			int rConf, String mOriginPf, String mStrePf, int mSortNo) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mNickname = mNickname;
		this.mBirthday = mBirthday;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.mEnrollDate = mEnrollDate;
		this.mModifyDate = mModifyDate;
		this.mGrad = mGrad;
		this.mPoint = mPoint;
		this.mStatus = mStatus;
		this.rConf = rConf;
		this.mOriginPf = mOriginPf;
		this.mStrePf = mStrePf;
		this.mSortNo = mSortNo;
	}



	public Member(int mNo, String mId, String mPwd, String mName, String mNickname, String mBirthday, String mEmail,
			String mPhone, String mAddress, Date mEnrollDate, Date mModifyDate, String mGrad, int mPoint, char mStatus,
			int rConf, String mOriginPf, String mStrePf) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mNickname = mNickname;
		this.mBirthday = mBirthday;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.mEnrollDate = mEnrollDate;
		this.mModifyDate = mModifyDate;
		this.mGrad = mGrad;
		this.mPoint = mPoint;
		this.mStatus = mStatus;
		this.rConf = rConf;
		this.mOriginPf = mOriginPf;
		this.mStrePf = mStrePf;
	}
	
	


	public Member(Date setleDe, String rName, int stPrc, int mPoint) {
		super();
		this.setleDe = setleDe;
		this.rName = rName;
		this.stPrc = stPrc;
		this.mPoint = mPoint;
	}

	public Member(int mNo, String mId, String mName, String mEmail, Date mEnrollDate, Date mModifyDate, char mStatus,
			int rConf, String mOriginPf, String mStrePf, int mSortNo) {
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
		this.mSortNo = mSortNo;
	}
	
	public Member(String mId, String mPwd) {
		super();
		this.mId = mId;
		this.mPwd = mPwd;
	}


	public Member(int mNo, String mId, String mPwd, String mName, char mStatus, int mSortNo) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mStatus = mStatus;
		this.mSortNo = mSortNo;
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


	public String getmPwd() {
		return mPwd;
	}


	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}


	public String getmName() {
		return mName;
	}


	public void setmName(String mName) {
		this.mName = mName;
	}


	public String getmNickname() {
		return mNickname;
	}


	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}


	public String getmBirthday() {
		return mBirthday;
	}


	public void setmBirthday(String mBirthday) {
		this.mBirthday = mBirthday;
	}


	public String getmEmail() {
		return mEmail;
	}


	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}


	public String getmPhone() {
		return mPhone;
	}


	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}


	public String getmAddress() {
		return mAddress;
	}


	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
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


	public String getmGrad() {
		return mGrad;
	}


	public void setmGrad(String mGrad) {
		this.mGrad = mGrad;
	}


	public int getmPoint() {
		return mPoint;
	}


	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}


	public char getmStatus() {
		return mStatus;
	}


	public void setmStatus(char mStatus) {
		this.mStatus = mStatus;
	}


	public int getrConf() {
		return rConf;
	}


	public void setrConf(int rConf) {
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

	
	public int getmSortNo() {
		return mSortNo;
	}


	public void setmSortNo(int mSortNo) {
		this.mSortNo = mSortNo;
	}

	
	
	public Date getSetleDe() {
		return setleDe;
	}

	public void setSetleDe(Date setleDe) {
		this.setleDe = setleDe;
	}

	public int getStPrc() {
		return stPrc;
	}

	public void setStPrc(int stPrc) {
		this.stPrc = stPrc;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName + ", mNickname="
				+ mNickname + ", mBirthday=" + mBirthday + ", mEmail=" + mEmail + ", mPhone=" + mPhone + ", mAddress="
				+ mAddress + ", mEnrollDate=" + mEnrollDate + ", mModifyDate=" + mModifyDate + ", mGrad=" + mGrad
				+ ", mPoint=" + mPoint + ", mStatus=" + mStatus + ", rConf=" + rConf + ", mOriginPf=" + mOriginPf
				+ ", mStrePf=" + mStrePf + ", mSortNo=" + mSortNo + ", setleDe=" + setleDe + ", stPrc=" + stPrc
				+ ", rName=" + rName + ", rNo=" + rNo + "]";
	}

	
	
	
}
