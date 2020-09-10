package com.kh.honeypoint.restaurant.model.vo;

import lombok.Data;

@Data
public class ReviewCount {
	private int allReviewCount;
	private int recommendReviewCount;
	private int okReviewCount;
	private int unRecommendReviewCount;
}
