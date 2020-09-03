package com.kh.honeypoint.restaurant.model.vo;

public class Restaurant {
	
	private String rNo;
	private int mNo;
	private int rTel;
	private String rType;
	private String rName;
	private String rAddress;
	private String rTag;
	private String rPrice;
	private char rParking;
	private int rStartTime;
	private int rEndTime;
	private double rRating;
	private String rIntro;
	private char resveYn;
	private String rRestDay;
	private char rConfm;
	private char rStatus;
	private int rCount;
	private double rLat;
	private double rLng;
	
	public Restaurant() {}

	public Restaurant(String rNo, int mNo, int rTel, String rType, String rName, String rAddress, String rTag,
			String rPrice, char rParking, int rStartTime, int rEndTime, double rRating, String rIntro, char resveYn,
			String rRestDay, char rConfm, char rStatus, int rCount, double rLat, double rLng) {
		super();
		this.rNo = rNo;
		this.mNo = mNo;
		this.rTel = rTel;
		this.rType = rType;
		this.rName = rName;
		this.rAddress = rAddress;
		this.rTag = rTag;
		this.rPrice = rPrice;
		this.rParking = rParking;
		this.rStartTime = rStartTime;
		this.rEndTime = rEndTime;
		this.rRating = rRating;
		this.rIntro = rIntro;
		this.resveYn = resveYn;
		this.rRestDay = rRestDay;
		this.rConfm = rConfm;
		this.rStatus = rStatus;
		this.rCount = rCount;
		this.rLat = rLat;
		this.rLng = rLng;
	}



	
	public double getrLat() {
		return rLat;
	}

	public void setrLat(double rLat) {
		this.rLat = rLat;
	}

	public double getrLng() {
		return rLng;
	}

	public void setrLng(double rLng) {
		this.rLng = rLng;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
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

	public int getrTel() {
		return rTel;
	}

	public void setrTel(int rTel) {
		this.rTel = rTel;
	}

	public String getrType() {
		return rType;
	}

	public void setrType(String rType) {
		this.rType = rType;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getrAddress() {
		return rAddress;
	}

	public void setrAddress(String rAddress) {
		this.rAddress = rAddress;
	}

	public String getrTag() {
		return rTag;
	}

	public void setrTag(String rTag) {
		this.rTag = rTag;
	}

	public String getrPrice() {
		return rPrice;
	}

	public void setrPrice(String rPrice) {
		this.rPrice = rPrice;
	}

	public char getrParking() {
		return rParking;
	}

	public void setrParking(char rParking) {
		this.rParking = rParking;
	}

	public int getrStartTime() {
		return rStartTime;
	}

	public void setrStartTime(int rStartTime) {
		this.rStartTime = rStartTime;
	}

	public int getrEndTime() {
		return rEndTime;
	}

	public void setrEndTime(int rEndTime) {
		this.rEndTime = rEndTime;
	}

	public double getrRating() {
		return rRating;
	}

	public void setrRating(double rRating) {
		this.rRating = rRating;
	}

	public String getrIntro() {
		return rIntro;
	}

	public void setrIntro(String rIntro) {
		this.rIntro = rIntro;
	}

	public char getResveYn() {
		return resveYn;
	}

	public void setResveYn(char resveYn) {
		this.resveYn = resveYn;
	}

	public String getrRestDay() {
		return rRestDay;
	}

	public void setrRestDay(String rRestDay) {
		this.rRestDay = rRestDay;
	}

	public char getrConfm() {
		return rConfm;
	}

	public void setrConfm(char rConfm) {
		this.rConfm = rConfm;
	}

	public char getrStatus() {
		return rStatus;
	}

	public void setrStatus(char rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "Restaurant [rNo=" + rNo + ", mNo=" + mNo + ", rTel=" + rTel + ", rType=" + rType + ", rName=" + rName
				+ ", rAddress=" + rAddress + ", rTag=" + rTag + ", rPrice=" + rPrice + ", rParking=" + rParking
				+ ", rStartTime=" + rStartTime + ", rEndTime=" + rEndTime + ", rRating=" + rRating + ", rIntro="
				+ rIntro + ", resveYn=" + resveYn + ", rRestDay=" + rRestDay + ", rConfm=" + rConfm + ", rStatus="
				+ rStatus + ", rCount=" + rCount + ", rLat=" + rLat + ", rLng=" + rLng + "]";
	}

	

	
	
}
