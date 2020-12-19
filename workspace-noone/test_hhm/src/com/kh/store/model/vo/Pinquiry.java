package com.kh.store.model.vo;

import java.sql.Date;

public class Pinquiry {
	private int piNo; //상품문의 번호
	private String secret; // 상품 비밀글유무
	private String piWriter; // 작성자
	private String piTitle;//문의제목
	private String piContent;// 문의 내용
	private Date piEnroll;//작성날짜
	private int pNo;//상품일련번호
	private int userNo;// 로그인한 사용자일련 번호
	private int count; //조회수
	private String replyStatus;// 답변상태
	private String piReply; //상품문의답변
	
	


	public Pinquiry(int piNo, String secret, String piWriter, String piTitle, String piContent, Date piEnroll, int pNo,
			int userNo, int count, String replyStatus, String piReply) {
		super();
		this.piNo = piNo;
		this.secret = secret;
		this.piWriter = piWriter;
		this.piTitle = piTitle;
		this.piContent = piContent;
		this.piEnroll = piEnroll;
		this.pNo = pNo;
		this.userNo = userNo;
		this.count = count;
		this.replyStatus = replyStatus;
		this.piReply = piReply;
	}


	public Pinquiry(int piNo, String secret, String piWriter, String piTitle, String piContent, Date piEnroll, int pNo,
			int userNo, int count, String replyStatus) {
		super();
		this.piNo = piNo;
		this.secret = secret;
		this.piWriter = piWriter;
		this.piTitle = piTitle;
		this.piContent = piContent;
		this.piEnroll = piEnroll;
		this.pNo = pNo;
		this.userNo = userNo;
		this.count = count;
		this.replyStatus = replyStatus;
	}


	public Pinquiry() {}

	
	public String getPiReply() {
		return piReply;
	}


	public void setPiReply(String piReply) {
		this.piReply = piReply;
	}

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}
	public int getPiNo() {
		return piNo;
	}
	public void setPiNo(int piNo) {
		this.piNo = piNo;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getPiWriter() {
		return piWriter;
	}
	public void setPiWriter(String piWriter) {
		this.piWriter = piWriter;
	}
	public String getPiTitle() {
		return piTitle;
	}
	public void setPiTitle(String piTitle) {
		this.piTitle = piTitle;
	}
	public String getPiContent() {
		return piContent;
	}
	public void setPiContent(String piContent) {
		this.piContent = piContent;
	}
	public Date getPiEnroll() {
		return piEnroll;
	}
	public void setPiEnroll(Date piEnroll) {
		this.piEnroll = piEnroll;
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
		return "Pinquiry [piNo=" + piNo + ", secret=" + secret + ", piWriter=" + piWriter + ", piTitle=" + piTitle
				+ ", piContent=" + piContent + ", piEnroll=" + piEnroll + ", pNo=" + pNo + ", userNo=" + userNo
				+ ", count=" + count + ", replyStatus=" + replyStatus + ", piReply=" + piReply + "]";
	}
}
