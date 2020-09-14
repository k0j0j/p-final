package com.kh.honeypoint.search.model.vo;

import java.util.ArrayList;
/*
@Data
@NoArgsConstructor
@AllArgsConstructor
*/
public class Restaurant {
	
	private String rNo;
	private int mNo;
	private String rTel;
	private String rType;
	private String rName;
	private String rAddress;
	private String rOAddress;
	private String rTag;
	private String rPrice;
	private char rParking;
	private String rStartTime;
	private String rEndTime;
	private double rRating;
	private String rIntro;
	private char resveYn;
	private String rRestDay;
	private char rConfm;
	private char rStatus;
	private int rCount;
	private ArrayList<Photofile> plist;
	
	public Restaurant() {};
	
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
	public String getrTel() {
		return rTel;
	}
	public void setrTel(String rTel) {
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
	public String getrOAddress() {
		return rOAddress;
	}
	public void setrOAddress(String rOAddress) {
		this.rOAddress = rOAddress;
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
	public String getrStartTime() {
		return rStartTime;
	}
	public void setrStartTime(String rStartTime) {
		this.rStartTime = rStartTime;
	}
	public String getrEndTime() {
		return rEndTime;
	}
	public void setrEndTime(String rEndTime) {
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
	public int getrCount() {
		return rCount;
	}
	public void setrCount(int rCount) {
		this.rCount = rCount;
	}
	public ArrayList<Photofile> getPlist() {
		return plist;
	}
	public void setPlist(ArrayList<Photofile> plist) {
		this.plist = plist;
	}
	public Restaurant(String rNo, int mNo, String rTel, String rType, String rName, String rAddress,
			String rOAddress, String rTag, String rPrice, char rParking, String rStartTime, String rEndTime,
			double rRating, String rIntro, char resveYn, String rRestDay, char rConfm, char rStatus, int rCount,
			ArrayList<Photofile> plist) {
		super();
		this.rNo = rNo;
		this.mNo = mNo;
		this.rTel = rTel;
		this.rType = rType;
		this.rName = rName;
		this.rAddress = rAddress;
		this.rOAddress = rOAddress;
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
		this.plist = plist;
	}
	@Override
	public String toString() {
		return "SearchRestaurant [rNo=" + rNo + ", mNo=" + mNo + ", rTel=" + rTel + ", rType=" + rType + ", rName="
				+ rName + ", rAddress=" + rAddress + ", rOAddress=" + rOAddress + ", rTag=" + rTag + ", rPrice="
				+ rPrice + ", rParking=" + rParking + ", rStartTime=" + rStartTime + ", rEndTime=" + rEndTime
				+ ", rRating=" + rRating + ", rIntro=" + rIntro + ", resveYn=" + resveYn + ", rRestDay=" + rRestDay
				+ ", rConfm=" + rConfm + ", rStatus=" + rStatus + ", rCount=" + rCount + ", getrNo()=" + getrNo()
				+ ", getmNo()=" + getmNo() + ", getrTel()=" + getrTel() + ", getrType()=" + getrType() + ", getrName()="
				+ getrName() + ", getrAddress()=" + getrAddress() + ", getrOAddress()=" + getrOAddress()
				+ ", getrTag()=" + getrTag() + ", getrPrice()=" + getrPrice() + ", getrParking()=" + getrParking()
				+ ", getrStartTime()=" + getrStartTime() + ", getrEndTime()=" + getrEndTime() + ", getrRating()="
				+ getrRating() + ", getrIntro()=" + getrIntro() + ", getResveYn()=" + getResveYn() + ", getrRestDay()="
				+ getrRestDay() + ", getrConfm()=" + getrConfm() + ", getrStatus()=" + getrStatus() + ", getrCount()="
				+ getrCount() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	

}
