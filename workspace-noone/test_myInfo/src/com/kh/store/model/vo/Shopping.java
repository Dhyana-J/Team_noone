package com.kh.store.model.vo;

public class Shopping {
	
	//장바구니 겸 주문관리 vo
	private int pNo; //상품번호
	private int userNo; //회원번호
	private int orderNo; //주문번호
	private int quantity; //주문수량
	private String status; //주문상태
	
	public Shopping() {}
	
	public Shopping(int pNo, int userNo, int orderNo, int quantity, String status) {
		super();
		this.pNo = pNo;
		this.userNo = userNo;
		this.orderNo = orderNo;
		this.quantity = quantity;
		this.status = status;
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

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Shopping [pNo=" + pNo + ", userNo=" + userNo + ", orderNo=" + orderNo + ", quantity=" + quantity
				+ ", status=" + status + "]";
	}
	
	
	
	
}
