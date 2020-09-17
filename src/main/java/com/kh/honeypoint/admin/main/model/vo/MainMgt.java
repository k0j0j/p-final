package com.kh.honeypoint.admin.main.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MainMgt {
	/* INQRY */
	private int iNo;
	private String inqryTitle;
	private String inqrySe;
	private int answerAt;	

	/* REPORT */
	private int rptNo;
	private String mId;
	private int rptCatNo;
	private String targetId;
	private int rptResult; 
	
	private String rptResn;
	
	/* ADVRTS*/
	private int bnrNo;
	private String bnrNm;
	private String bnrNote;
	private String bnrStatus;
	private String bnrOn;
	
	/* M-Count */
	private int mSortNo;
	private char mStatus;
	
	/* RT-Count */
	private int rStatus;
	
	/* RE-Count */
	
	/* Login  History */
	private int mNo;
	private Date lTime;
	private int lNo;
	
	
}
