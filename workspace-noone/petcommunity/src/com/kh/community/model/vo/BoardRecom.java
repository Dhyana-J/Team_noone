package com.kh.community.model.vo;

public class BoardRecom {

	private int boardNo;
	private String userNo;
	
	public BoardRecom() {}
	
	public BoardRecom(int boardNo, String userNo) {
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

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "BoardRecom [boardNo=" + boardNo + ", userNo=" + userNo + "]";
	}
	
	
	
	
	
}
