package com.kh.store.model.vo;

import java.util.ArrayList;

public class ImageUrl {
	private int pNo;
	private String filePath;
	
	public ImageUrl() {
		
	}

	public ImageUrl(int pNo, String filePath) {
		super();
		this.pNo = pNo;
		this.filePath = filePath;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "ImageUrl [pNo=" + pNo + ", filePath=" + filePath + "]";
	}
	
}
