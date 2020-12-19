package com.kh.member.model.vo;

import java.sql.Date;

public class MyOrder {
	
	//내 주문내역 조회용 객체 (주문정보, 장바구니, 상품정보 테이블 조인해서 가져와야함)
	
	private int pNo; //상품번호
	private int orderNo; //주문번호(식별자)
	private int quantity; //주문수량
	private String pThumbUrl; //상품사진url
	private String pName; //상품명
	private int price; //결제금액
	private Date orderDate;//주문날짜
	private String dStatus; //배송상태  B, D, C
	private String shoppingStatus; //주문상태 B,C,R
	private String dCompany;//배송회사
	private int dNum;//운송장
	
	public MyOrder() {}

	public MyOrder(int pNo, int orderNo, int quantity, String pThumbUrl, String pName, int price, Date orderDate,
			String dStatus, String shoppingStatus, String dCompany, int dNum) {
		super();
		this.pNo = pNo;
		this.orderNo = orderNo;
		this.quantity = quantity;
		this.pThumbUrl = pThumbUrl;
		this.pName = pName;
		this.price = price;
		this.orderDate = orderDate;
		this.dStatus = dStatus;
		this.shoppingStatus = shoppingStatus;
		this.dCompany = dCompany;
		this.dNum = dNum;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
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

	public String getpThumbUrl() {
		return pThumbUrl;
	}

	public void setpThumbUrl(String pThumbUrl) {
		this.pThumbUrl = pThumbUrl;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}

	public String getShoppingStatus() {
		return shoppingStatus;
	}

	public void setShoppingStatus(String shoppingStatus) {
		this.shoppingStatus = shoppingStatus;
	}

	public String getdCompany() {
		return dCompany;
	}

	public void setdCompany(String dCompany) {
		this.dCompany = dCompany;
	}

	public int getdNum() {
		return dNum;
	}

	public void setdNum(int dNum) {
		this.dNum = dNum;
	}

	@Override
	public String toString() {
		return "MyOrder [pNo=" + pNo + ", orderNo=" + orderNo + ", quantity=" + quantity + ", pThumbUrl=" + pThumbUrl
				+ ", pName=" + pName + ", price=" + price + ", orderDate=" + orderDate + ", dStatus=" + dStatus
				+ ", shoppingStatus=" + shoppingStatus + ", dCompany=" + dCompany + ", dNum=" + dNum + "]";
	}

	

	
	
	
	
	
	
}
