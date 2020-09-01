package com.kh.honeypoint.restaurant.model.vo;

public class Review {
	private int revNo;
	private String revCn;
	private int score;
	private char revStatus;
	private String rNo;
	private int mNo;
	
	public Review() {}

	public Review(int revNo, String revCn, int score, char revStatus, String rNo, int mNo) {
		super();
		this.revNo = revNo;
		this.revCn = revCn;
		this.score = score;
		this.revStatus = revStatus;
		this.rNo = rNo;
		this.mNo = mNo;
	}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public String getRevCn() {
		return revCn;
	}

	public void setRevCn(String revCn) {
		this.revCn = revCn;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public char getRevStatus() {
		return revStatus;
	}

	public void setRevStatus(char revStatus) {
		this.revStatus = revStatus;
	}

	public String getrNo() {
		return rNo;
	}

	public void setrNo(String rNo) {
		this.rNo = rNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	@Override
	public String toString() {
		return "Review [revNo=" + revNo + ", revCn=" + revCn + ", score=" + score + ", revStatus=" + revStatus
				+ ", rNo=" + rNo + ", mNo=" + mNo + "]";
	}
	
	
}
