package com.kh.honeypoint.restaurant.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class InsertReviewImg {
	private ArrayList<String> originFileList;
	private ArrayList<String> renameFileList;
	private int revNo;
	private int rNo;
	
}


