package com.kh.member.model.vo;

import java.sql.Date;

public class MyQna {
	
	private int inquiryNo;
	private String inquiryTitle;
	private Date inquiryDate; 
	private String inquiryType; //문의카테고리
	
	public MyQna() {}
	
	public MyQna(int inquiryNo, String inquiryTitle, Date inquiryDate, String inquiryType) {
		super();
		this.inquiryNo = inquiryNo;
		this.inquiryTitle = inquiryTitle;
		this.inquiryDate = inquiryDate;
		this.inquiryType = inquiryType;
	}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public String getInquiryType() {
		return inquiryType;
	}

	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}

	@Override
	public String toString() {
		return "MyInquiry [inquiryNo=" + inquiryNo + ", inquiryTitle=" + inquiryTitle + ", inquiryDate=" + inquiryDate
				+ ", inquiryType=" + inquiryType + "]";
	}
	
	
	

}
