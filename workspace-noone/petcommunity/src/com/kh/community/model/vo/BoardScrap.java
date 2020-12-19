package com.kh.community.model.vo;

public class BoardScrap {

	private int boardNo;
	private int userNo;
	
	public BoardScrap() {}

	public BoardScrap(int boardNo, int userNo) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "BoardScrap [boardNo=" + boardNo + ", userNo=" + userNo + "]";
	}

	

	
	
	
}



