package com.kh.honeypoint.admin.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Search {
	private String searchCondition;
	private String searchValue;
	private String existFile;	
}
