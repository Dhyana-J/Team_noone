package com.kh.scenter.model.vo;

public class Faq {
	
	private int faqNo;
	private String faqContent;
	private String faqAnswer;
	
	public Faq() {
		
	}

	public Faq(int faqNo, String faqContent, String faqAnswer) {
		super();
		this.faqNo = faqNo;
		this.faqContent = faqContent;
		this.faqAnswer = faqAnswer;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getFaqAnswer() {
		return faqAnswer;
	}

	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqContent=" + faqContent + ", faqAnswer=" + faqAnswer + "]";
	}
	
	
}
