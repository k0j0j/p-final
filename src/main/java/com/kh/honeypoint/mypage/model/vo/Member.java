package com.kh.honeypoint.mypage.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String mId;
	private String mName;
	private String mEmail;
	private Date mEnrollDate;
	private Date mModifyDate;
	private char mStatus;
	private char rConf;
	private int mPhone;
	private String mAddress;
	private String mOriginPf;
	private String mStrePf;
	private int mSortNo;
	private int mGrad;
	private int mPoint;
	
	
	
	
	/*
	 * public Member() {}
	 * public Member(String mName ,String mId, String mPwd, String mEmail, String mPhone, String mAddress, String mSecsnCn ,int mNo) {
		super();
		this.mName = mName;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.mSecsnCn = mSecsnCn;
		this.mNo = mNo;
	}

	

	 회원정보 수정 
	public Member(String mId, String mEmail, String mPhone, String mAddress) {
		super();
		this.mId = mId;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
	}



	public Member(String mId, String mEmail) {
		super();
		this.mId = mId;
		this.mEmail = mEmail;
	}*/






	
	
}
