package com.kh.member.model.vo;

public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phone;
	private String address;
	private String addressDetail;
	private int addressCode;
	private String quit;
	private String manager;
	private int reportAmount;
	
	public Member() {
		
	}

	public Member(int userNo, String userId, String userPwd, String userName, String email, String phone,
			String address, String addressDetail, int addressCode, String quit, String manager, int reportAmount) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.addressDetail = addressDetail;
		this.addressCode = addressCode;
		this.quit = quit;
		this.manager = manager;
		this.reportAmount = reportAmount;
	}
	
	public Member(String userId, String userPwd, String userName, String email, String phone) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
	}

	

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public int getAddressCode() {
		return addressCode;
	}

	public void setAddressCode(int addressCode) {
		this.addressCode = addressCode;
	}

	public String getQuit() {
		return quit;
	}

	public void setQuit(String quit) {
		this.quit = quit;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public int getReportAmount() {
		return reportAmount;
	}

	public void setReportAmount(int reportAmount) {
		this.reportAmount = reportAmount;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", phone=" + phone + ", address=" + address + ", addressDetail=" + addressDetail
				+ ", addressCode=" + addressCode + ", quit=" + quit + ", manager=" + manager + ", reportAmount="
				+ reportAmount + "]";
	}
	
	
}
