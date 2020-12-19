package com.kh.store.model.vo;

import java.sql.Date;

public class Review {
	private int reviewNO;//리뷰번호
	private String reviewTitle;//리뷰제목
	private String reviewContent;//리뷰내용
	private Date reviewDate;//리뷰등록일
	private int reviewRating;//리뷰평점
	private int pNo;//상품번호
	private int userNo;//작성자번호
	private String userName;//작성자이름
	
	
	public Review() {}
	
	public Review(int reviewNO, String reviewTitle, String reviewContent, Date reviewDate, int reviewRating, int pNo,
			int userNo) {
		super();
		this.reviewNO = reviewNO;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewRating = reviewRating;
		this.pNo = pNo;
		this.userNo = userNo;
	}




	public Review(int reviewNO, String reviewTitle, String reviewContent, Date reviewDate, int reviewRating, int pNo,
			int userNo, String userName) {
		super();
		this.reviewNO = reviewNO;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewRating = reviewRating;
		this.pNo = pNo;
		this.userNo = userNo;
		this.userName = userName;
	}

	public int getReviewNO() {
		return reviewNO;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setReviewNO(int reviewNO) {
		this.reviewNO = reviewNO;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
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

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Review [reviewNO=" + reviewNO + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", reviewDate=" + reviewDate + ", reviewRating=" + reviewRating + ", pNo=" + pNo + ", userNo="
				+ userNo + ", userName=" + userName + "]";
	}
	
	
}