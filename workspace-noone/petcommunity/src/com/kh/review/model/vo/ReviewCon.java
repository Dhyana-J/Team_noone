package com.kh.review.model.vo;

public class ReviewCon {
	private String reportClass;
	private String reportContent;
	private int reviewNo;
	private String userName;
	private String reportStatus;
	
	public ReviewCon() {
		
	}

	public ReviewCon(String reportClass, String reportContent, int reviewNo, String userName, String reportStatus) {
		super();
		this.reportClass = reportClass;
		this.reportContent = reportContent;
		this.reviewNo = reviewNo;
		this.userName = userName;
		this.reportStatus = reportStatus;
	}

	public String getReportClass() {
		return reportClass;
	}

	public void setReportClass(String reportClass) {
		this.reportClass = reportClass;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	@Override
	public String toString() {
		return "ReviewCon [reportClass=" + reportClass + ", reportContent=" + reportContent + ", reviewNo=" + reviewNo
				+ ", userName=" + userName + ", reportStatus=" + reportStatus + "]";
	}

	
	
}
