package com.kh.store.model.vo;

import java.sql.Date;

public class Order {

	private int orderNo;
	private int userNo;
	private String rName; //r : 주문자
	private int rCode; //우편번호
	private String rAddr;
	private String rdAddr;//상세주소
	private String rPhone;
	private Date orderDate;
	private String orderStatus;
	private int orderCost;//주문금액
	private String dCompany; //배송사
	private int dNum;//운송장
	private String dStatus;//배송상태
	private String orderReqest;//배송요청사항
	private int payCost;//결제금액
	private String payMethod;//결제수단
	private Date payDate;//결제날짜
	
	public Order() {}

	public Order(int orderNo, int userNo, String rName, int rCode, String rAddr, String rdAddr, String rPhone,
			Date orderDate, String orderStatus, int orderCost, String dCompany, int dNum, String dStatus,
			String orderReqest, int payCost, String payMethod, Date payDate) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.rName = rName;
		this.rCode = rCode;
		this.rAddr = rAddr;
		this.rdAddr = rdAddr;
		this.rPhone = rPhone;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.orderCost = orderCost;
		this.dCompany = dCompany;
		this.dNum = dNum;
		this.dStatus = dStatus;
		this.orderReqest = orderReqest;
		this.payCost = payCost;
		this.payMethod = payMethod;
		this.payDate = payDate;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public int getrCode() {
		return rCode;
	}

	public void setrCode(int rCode) {
		this.rCode = rCode;
	}

	public String getrAddr() {
		return rAddr;
	}

	public void setrAddr(String rAddr) {
		this.rAddr = rAddr;
	}

	public String getRdAddr() {
		return rdAddr;
	}

	public void setRdAddr(String rdAddr) {
		this.rdAddr = rdAddr;
	}

	public String getrPhone() {
		return rPhone;
	}

	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getOrderCost() {
		return orderCost;
	}

	public void setOrderCost(int orderCost) {
		this.orderCost = orderCost;
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

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}

	public String getOrderReqest() {
		return orderReqest;
	}

	public void setOrderReqest(String orderReqest) {
		this.orderReqest = orderReqest;
	}

	public int getPayCost() {
		return payCost;
	}

	public void setPayCost(int payCost) {
		this.payCost = payCost;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userNo=" + userNo + ", rName=" + rName + ", rCode=" + rCode + ", rAddr="
				+ rAddr + ", rdAddr=" + rdAddr + ", rPhone=" + rPhone + ", orderDate=" + orderDate + ", orderStatus="
				+ orderStatus + ", orderCost=" + orderCost + ", dCompany=" + dCompany + ", dNum=" + dNum + ", dStatus="
				+ dStatus + ", orderReqest=" + orderReqest + ", payCost=" + payCost + ", payMethod=" + payMethod
				+ ", payDate=" + payDate + "]";
	}
	
	
	
}
