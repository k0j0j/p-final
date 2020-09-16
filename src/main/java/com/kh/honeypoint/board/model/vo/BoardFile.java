package com.kh.honeypoint.board.model.vo;

public class BoardFile {
	private int bImgNo;
	private int bNo;
	private String bStreFileNm;
	private String bImgPath;
	private String bOriginFileNm;
	private int bImgSize;
	
	public BoardFile() {}

	public BoardFile(int bImgNo, int bNo, String bStreFileNm, String bImgPath, String bOriginFileNm, int bImgSize) {
		super();
		this.bImgNo = bImgNo;
		this.bNo = bNo;
		this.bStreFileNm = bStreFileNm;
		this.bImgPath = bImgPath;
		this.bOriginFileNm = bOriginFileNm;
		this.bImgSize = bImgSize;
	}

	public int getbImgNo() {
		return bImgNo;
	}

	public void setbImgNo(int bImgNo) {
		this.bImgNo = bImgNo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbStreFileNm() {
		return bStreFileNm;
	}

	public void setbStreFileNm(String bStreFileNm) {
		this.bStreFileNm = bStreFileNm;
	}

	public String getbImgPath() {
		return bImgPath;
	}

	public void setbImgPath(String bImgPath) {
		this.bImgPath = bImgPath;
	}

	public String getbOriginFileNm() {
		return bOriginFileNm;
	}

	public void setbOriginFileNm(String bOriginFileNm) {
		this.bOriginFileNm = bOriginFileNm;
	}

	public int getbImgSize() {
		return bImgSize;
	}

	public void setbImgSize(int bImgSize) {
		this.bImgSize = bImgSize;
	}

	@Override
	public String toString() {
		return "BoardFile [bImgNo=" + bImgNo + ", bNo=" + bNo + ", bStreFileNm=" + bStreFileNm + ", bImgPath="
				+ bImgPath + ", bOriginFileNm=" + bOriginFileNm + ", bImgSize=" + bImgSize + "]";
	}
	
	
}


