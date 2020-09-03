package com.kh.honeypoint.admin.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
/*
@Getter
@Setter
*/
@NoArgsConstructor
@AllArgsConstructor
public class MemberMgt {
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
	
	/* TB_GNRL_MEMBER */
	private String mNickname;
	private int mBirthday;
	private int mPhone;
	private String mAddress;
	private int mGrad;
	private int mPoint;
	
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

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	public int getmBirthday() {
		return mBirthday;
	}

	public void setmBirthday(int mBirthday) {
		this.mBirthday = mBirthday;
	}

	public int getmPhone() {
		return mPhone;
	}

	public void setmPhone(int mPhone) {
		this.mPhone = mPhone;
	}

	public String getmAddress() {
		return mAddress;
	}

	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}

	public int getmGrad() {
		return mGrad;
	}

	public void setmGrad(int mGrad) {
		this.mGrad = mGrad;
	}

	public int getmPoint() {
		return mPoint;
	}

	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	};


}
