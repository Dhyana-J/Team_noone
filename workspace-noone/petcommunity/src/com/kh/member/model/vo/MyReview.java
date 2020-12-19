package com.kh.member.model.vo;

import java.sql.Date;

public class MyReview {
	
	private int reviewNo;
	private int productNo;
	private String reviewTitle;
	private Date reviewDate;
	private int reviewRating;
	
	
	public MyReview(int reviewNo, int productNo, String reviewTitle, Date reviewDate, int reviewRating) {
		super();
		this.reviewNo = reviewNo;
		this.productNo = productNo;
		this.reviewTitle = reviewTitle;
		this.reviewDate = reviewDate;
		this.reviewRating = reviewRating;
	}
	
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	
	
	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReviewRating() {
		return reviewRating;
	}
	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}


	@Override
	public String toString() {
		return "MyReview [reviewNo=" + reviewNo + ", productNo=" + productNo + ", reviewTitle=" + reviewTitle
				+ ", reviewDate=" + reviewDate + ", reviewRating=" + reviewRating + "]";
	}
	
	
	

}
