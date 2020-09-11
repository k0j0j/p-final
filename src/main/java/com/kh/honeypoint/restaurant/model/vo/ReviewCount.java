package com.kh.honeypoint.restaurant.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ReviewCount {
	private int allReviewCount;
	private int recommendReviewCount;
	private int okReviewCount;
	private int unRecommendReviewCount;
}
