package com.kh.honeypoint.admin.Advrts.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AdvrtsMgt {	
	private int bnrNo;
	private String bnrNm;
	private String bnrCategory;
	private String bnrNote;
	private String bnrUrl;
	private String bnrOn;
	private String bnrStatus;
	private Date bnrDate;
	private Date bnrDelDate;
	
	private String bnrOFile;
	private String bnrRFile;
}
