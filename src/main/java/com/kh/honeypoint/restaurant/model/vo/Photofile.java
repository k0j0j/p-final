package com.kh.honeypoint.restaurant.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Photofile {
	private int photofileId;
	private int rNo;
	private String originFileName;
	private String streFileName;
	private int imgType;
}
