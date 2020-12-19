package com.kh.community.model.vo;

import java.sql.Date;

public class Board {

	private int boardNo;
	private String userNo;
	private String boardTitle;
	private String boardContent;
	private String boardPhoto;
	private Date boardDate;
	private Date boardModify;
	private int boardCount;
	private int boardRecom;
	private String boardCategory;
	
	public Board() {}

	public Board(int boardNo, String userNo, String boardTitle, String boardContent, String boardPhoto, Date boardDate,
			Date boardModify, int boardCount, int boardRecom, String boardCategory) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardPhoto = boardPhoto;
		this.boardDate = boardDate;
		this.boardModify = boardModify;
		this.boardCount = boardCount;
		this.boardRecom = boardRecom;
		this.boardCategory = boardCategory;
	}

	
	public Board(int boardNo, String userNo, String boardTitle, Date boardDate, int boardCount) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.boardTitle = boardTitle;
		this.boardDate = boardDate;
		this.boardCount = boardCount;
	}

	
	
	public Board(String userNo, String boardTitle, String boardContent, String boardPhoto) {
		super();
		this.userNo = userNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardPhoto = boardPhoto;
	}



	public Board(int boardNo, String userNo, String boardTitle, String boardContent, Date boardDate) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
	}

	public Board(int boardNo, String userNo, String boardTitle, String boardContent, String boardPhoto, Date boardDate,
			int boardRecom) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardPhoto = boardPhoto;
		this.boardDate = boardDate;
		this.boardRecom = boardRecom;
	}

	
	
	public Board(int boardNo, String boardTitle, String boardContent, String boardPhoto) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardPhoto = boardPhoto;
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

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardPhoto() {
		return boardPhoto;
	}

	public void setBoardPhoto(String boardPhoto) {
		this.boardPhoto = boardPhoto;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public Date getBoardModify() {
		return boardModify;
	}

	public void setBoardModify(Date boardModify) {
		this.boardModify = boardModify;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getBoardRecom() {
		return boardRecom;
	}

	public void setBoardRecom(int boardRecom) {
		this.boardRecom = boardRecom;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", userNo=" + userNo + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardPhoto=" + boardPhoto + ", boardDate=" + boardDate + ", boardModify="
				+ boardModify + ", boardCount=" + boardCount + ", boardRecom=" + boardRecom + ", boardCategory="
				+ boardCategory + "]";
	}
	
	
	
	
	
}
