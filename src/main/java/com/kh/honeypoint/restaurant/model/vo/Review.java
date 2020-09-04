package com.kh.honeypoint.restaurant.model.vo;

import lombok.Data;

@Data
public class Review {
	private int revNo;
	private String revCn;
	private int score;
	private char revStatus;
	private String rNo;
	private int mNo;
}
