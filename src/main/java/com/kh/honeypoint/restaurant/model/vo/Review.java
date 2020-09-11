package com.kh.honeypoint.restaurant.model.vo;

import com.kh.honeypoint.member.model.vo.GnrlMember;
import com.kh.honeypoint.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int revNo;
	private int rNo;
	private String revCn;
	private String revDate;
	private int score;
	private char revStatus;
	private int mNo;

	private Member member;
	private GnrlMember gnrlMember;
}
