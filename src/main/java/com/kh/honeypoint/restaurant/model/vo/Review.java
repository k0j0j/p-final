package com.kh.honeypoint.restaurant.model.vo;

import com.kh.honeypoint.member.model.vo.GnrlMember;
import com.kh.honeypoint.member.model.vo.Member;

import lombok.Data;

@Data
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
