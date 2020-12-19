package com.kh.community.model.vo;

import java.sql.Date;

public class BoardComment {

	private int commentNo;
	private int boardNo;
	private String userNo;
	private String commentContent;
	private Date commentDate;
	private Date commentModify;
	
	public BoardComment() {}

	public BoardComment(int commentNo, int boardNo, String userNo, String commentContent, Date commentDate,
			Date commentModify) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
		this.commentModify = commentModify;
	}

	
	
	public BoardComment(int commentNo, String userNo, String commentContent, Date commentDate) {
		super();
		this.commentNo = commentNo;
		this.userNo = userNo;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
	}

	
	
	
	



	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public Date getCommentModify() {
		return commentModify;
	}

	public void setCommentModify(Date commentModify) {
		this.commentModify = commentModify;
	}

	@Override
	public String toString() {
		return "BoardComment [commentNo=" + commentNo + ", boardNo=" + boardNo + ", userNo=" + userNo
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + ", commentModify="
				+ commentModify + "]";
	}
	
	
	
}
