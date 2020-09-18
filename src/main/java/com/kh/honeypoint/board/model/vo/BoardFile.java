package com.kh.honeypoint.board.model.vo;

public class BoardFile {
	private int bImgNo;
	private int bNo;
	private String streFileName;
	private String bImgPath;
	private String originFileName;
	private int bImgSize;
	
	public BoardFile() {}

	public BoardFile(int bImgNo, int bNo, String streFileName, String bImgPath, String originFileName, int bImgSize) {
		super();
		this.bImgNo = bImgNo;
		this.bNo = bNo;
		this.streFileName = streFileName;
		this.bImgPath = bImgPath;
		this.originFileName = originFileName;
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

	public String getStreFileName() {
		return streFileName;
	}

	public void setStreFileName(String streFileName) {
		this.streFileName = streFileName;
	}

	public String getbImgPath() {
		return bImgPath;
	}

	public void setbImgPath(String bImgPath) {
		this.bImgPath = bImgPath;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public int getbImgSize() {
		return bImgSize;
	}

	public void setbImgSize(int bImgSize) {
		this.bImgSize = bImgSize;
	}

	@Override
	public String toString() {
		return "BoardFile [bImgNo=" + bImgNo + ", bNo=" + bNo + ", streFileName=" + streFileName + ", bImgPath="
				+ bImgPath + ", originFileName=" + originFileName + ", bImgSize=" + bImgSize + "]";
	}

	
}


