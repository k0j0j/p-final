package com.kh.honeypoint.admin.manager.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Manager {
	private int mngNo;
	private String mngPosition;
	private String mngPwd;	
	
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
	
	/* TB_MEM_SECSN */
	private int mSecsn;
	private Date mSecsnDe;
	
	/* TB_MEM_SECSN_CN*/
	private String mSecsnCn;
	
}