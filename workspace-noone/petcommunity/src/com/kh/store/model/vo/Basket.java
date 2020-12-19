package com.kh.store.model.vo;

public class Basket {
	

	private int pno;// 상품번호
	private int userNo; //장바구니사용자 번호
	private int orderNo; // 장바구니 일련번호
	private int cartAmount; //선택수량
	private String shoppingStatus; // 주문상태
	private String pthumbnailUrl; // 상품썸네일사진
	private String pName;//상품이름
	private int price;//상품가격
	
	public Basket() {}
	public Basket(int pno, int userNo, int orderNo, int cartAmount, String shoppingStatus, String pthumbnailUrl,
			String pName, int price) {
		super();
		this.pno = pno;
		this.userNo = userNo;
		this.orderNo = orderNo;
		this.cartAmount = cartAmount;
		this.shoppingStatus = shoppingStatus;
		this.pthumbnailUrl = pthumbnailUrl;
		this.pName = pName;
		this.price = price;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
	public int getCartAmount() {
		return cartAmount;
	}
	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}
	public String getShoppingStatus() {
		return shoppingStatus;
	}
	public void setShoppingStatus(String shoppingStatus) {
		this.shoppingStatus = shoppingStatus;
	}
	public String getPthumbnailUrl() {
		return pthumbnailUrl;
	}
	public void setPthumbnailUrl(String pthumbnailUrl) {
		this.pthumbnailUrl = pthumbnailUrl;
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
	@Override
	public String toString() {
		return "Basket [pno=" + pno + ", userNo=" + userNo + ", orderNo=" + orderNo + ", cartAmount=" + cartAmount
				+ ", shoppingStatus=" + shoppingStatus + ", pthumbnailUrl=" + pthumbnailUrl + ", pName=" + pName
				+ ", price=" + price + "]";
	}

	
	
	
	
	
	
	
}
