package com.kh.review.model.vo;

import java.sql.Date;

public class Report {
	private int reportNo;
	private int userNo;
	private int reportClassNo;
	private String reportContent;
	private Date reportDate;
	private String reportCate;
	private int reportCateNo;
	
	public Report() {
		
	}

	public Report(int reportNo, int userNo, int reportClassNo, String reportContent, Date reportDate, String reportCate,
			int reportCateNo) {
		super();
		this.reportNo = reportNo;
		this.userNo = userNo;
		this.reportClassNo = reportClassNo;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportCate = reportCate;
		this.reportCateNo = reportCateNo;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getReportClassNo() {
		return reportClassNo;
	}

	public void setReportClassNo(int reportClassNo) {
		this.reportClassNo = reportClassNo;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportCate() {
		return reportCate;
	}

	public void setReportCate(String reportCate) {
		this.reportCate = reportCate;
	}

	public int getReportCateNo() {
		return reportCateNo;
	}

	public void setReportCateNo(int reportCateNo) {
		this.reportCateNo = reportCateNo;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", userNo=" + userNo + ", reportClassNo=" + reportClassNo
				+ ", reportContent=" + reportContent + ", reportDate=" + reportDate + ", reportCate=" + reportCate
				+ ", reportCateNo=" + reportCateNo + "]";
	}
	
	
}
