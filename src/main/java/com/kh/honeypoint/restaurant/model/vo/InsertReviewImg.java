package com.kh.honeypoint.restaurant.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InsertReviewImg {
	private ArrayList<String> originFileList;
	private ArrayList<String> renameFileList;
	private int revNo;
	private int rNo;
}
