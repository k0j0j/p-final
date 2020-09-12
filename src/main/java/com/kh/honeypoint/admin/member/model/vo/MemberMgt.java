package com.kh.honeypoint.admin.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
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
	private int mSortNo;
	
	/* TB_GNRL_MEMBER */
	private String mNickname;
	private int mBirthday;
	private String mPhone;
	private String mAddress;
	private int mGrad;
	private int mPoint;
	
	/* TB_MEM_SECSN */
	private int mSecsn;
	private Date mSecsnDe;
	
	/* TB_MEM_SECSN_CN*/
	private String mSecsnCn;
	
	
}
