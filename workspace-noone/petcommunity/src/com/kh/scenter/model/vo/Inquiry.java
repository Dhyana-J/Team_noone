package com.kh.scenter.model.vo;

import java.sql.Date;

public class Inquiry {
	private int inquiryNo;
	private String userName;
	private String inquiryTitle;
	private String inquiryContent;
	private Date inquiryDate;
	private String status;
	private String inquiryType;
	private String reContent;
	private Date reDate;
	
	private int userNo;
	
	public Inquiry() {
		
	}

	public Inquiry(int inquiryNo, String userName, String inquiryTitle, String inquiryContent, Date inquiryDate,
			String status, String inquiryType, String reContent, Date reDate) {
		super();
		this.inquiryNo = inquiryNo;
		this.userName = userName;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.inquiryDate = inquiryDate;
		this.status = status;
		this.inquiryType = inquiryType;
		this.reContent = reContent;
		this.reDate = reDate;
	}
	
	

	public Inquiry(int inquiryNo, String inquiryTitle, String inquiryContent, Date inquiryDate, String status,
			String inquiryType, String reContent, Date reDate, int userNo) {
		super();
		this.inquiryNo = inquiryNo;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.inquiryDate = inquiryDate;
		this.status = status;
		this.inquiryType = inquiryType;
		this.reContent = reContent;
		this.reDate = reDate;
		this.userNo = userNo;
	}
	
	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getInquiryType() {
		return inquiryType;
	}

	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public Date getReDate() {
		return reDate;
	}

	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}
	
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Inquiry [inquiryNo=" + inquiryNo + ", userName=" + userName + ", inquiryTitle=" + inquiryTitle
				+ ", inquiryContent=" + inquiryContent + ", inquiryDate=" + inquiryDate + ", status=" + status
				+ ", inquiryType=" + inquiryType + ", reContent=" + reContent + ", reDate=" + reDate + "]";
	}

	
}
