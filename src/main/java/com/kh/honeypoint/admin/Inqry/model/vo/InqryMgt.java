package com.kh.honeypoint.admin.Inqry.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InqryMgt {	
	
	private int iNo;
	private String inqrySe;
	private String inqryTitle;
	private Date inqryDate;
	private int answerAt;
	
	private String inqryContent;
	private int inqryPerson;
	private int inqryAnswer;	// 필요없음
	private int mSe;
	
	private int mNo;
	private String mId;
		
		

}
