package com.kh.honeypoint.restaurant.model.vo;

import lombok.Data;

@Data
public class Restaurant {
	
	private String rNo;
	private int mNo;
	private int rTel;
	private String rType;
	private String rName;
	private String rAddress;
	private String rOAddress;
	private String rTag;
	private String rPrice;
	private char rParking;
	private int rStartTime;
	private int rEndTime;
	private double rRating;
	private String rIntro;
	private char resveYn;
	private String rRestDay;
	private char rConfm;
	private char rStatus;
	private int rCount;

}
