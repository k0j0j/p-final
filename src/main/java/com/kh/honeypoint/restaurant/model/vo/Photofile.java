package com.kh.honeypoint.restaurant.model.vo;

import lombok.Data;

@Data
public class Photofile {
	private int photofileId;
	private int rNo;
	private String originFileName;
	private String streFileName;
	private int imgType;
}
