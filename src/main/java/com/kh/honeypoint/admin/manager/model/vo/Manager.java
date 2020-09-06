package com.kh.honeypoint.admin.manager.model.vo;

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
	private String mngId;
	private String mngName;
	private String mngPosition;
	private String mngPhone;
	private String mngStatus;
}