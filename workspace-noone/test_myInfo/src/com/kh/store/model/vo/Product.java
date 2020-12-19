package com.kh.store.model.vo;

public class Product {
	private int pNo;
	private String pName;
	private int price;
	private String description;
	private int pStock;
	private String pCategory;
	private String pBrand;
	private String pModel;
	private String pThumbUrl;
	private int pSales;
	private int ptotal;
	private String adStatus;
	private String adContent;
	private int adPoint;
	
	public Product(){
		
	}

	public Product(int pNo, String pName, int price, String description, int pStock, String pCategory, String pBrand,
			String pModel, String pThumbUrl, int pSales, int ptotal, String adStatus, String adContent, int adPoint) {
		super();
		this.pNo = pNo;
		this.pName = pName;
		this.price = price;
		this.description = description;
		this.pStock = pStock;
		this.pCategory = pCategory;
		this.pBrand = pBrand;
		this.pModel = pModel;
		this.pThumbUrl = pThumbUrl;
		this.pSales = pSales;
		this.ptotal = ptotal;
		this.adStatus = adStatus;
		this.adContent = adContent;
		this.adPoint = adPoint;
	}

	public Product(String pName, int price, String description, int pStock, String pCategory, String pBrand,
			String pModel, String pThumbUrl) {
		super();
		this.pName = pName;
		this.price = price;
		this.description = description;
		this.pStock = pStock;
		this.pCategory = pCategory;
		this.pBrand = pBrand;
		this.pModel = pModel;
		this.pThumbUrl = pThumbUrl;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getpStock() {
		return pStock;
	}

	public void setpStock(int pStock) {
		this.pStock = pStock;
	}

	public String getpCategory() {
		return pCategory;
	}

	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}

	public String getpBrand() {
		return pBrand;
	}

	public void setpBrand(String pBrand) {
		this.pBrand = pBrand;
	}

	public String getpModel() {
		return pModel;
	}

	public void setpModel(String pModel) {
		this.pModel = pModel;
	}

	public String getpThumbUrl() {
		return pThumbUrl;
	}

	public void setpThumbUrl(String pThumbUrl) {
		this.pThumbUrl = pThumbUrl;
	}

	public int getpSales() {
		return pSales;
	}

	public void setpSales(int pSales) {
		this.pSales = pSales;
	}

	public int getPtotal() {
		return ptotal;
	}

	public void setPtotal(int ptotal) {
		this.ptotal = ptotal;
	}

	public String getAdStatus() {
		return adStatus;
	}

	public void setAdStatus(String adStatus) {
		this.adStatus = adStatus;
	}

	public String getAdContent() {
		return adContent;
	}

	public void setAdContent(String adContent) {
		this.adContent = adContent;
	}

	public int getAdPoint() {
		return adPoint;
	}

	public void setAdPoint(int adPoint) {
		this.adPoint = adPoint;
	}

	@Override
	public String toString() {
		return "Product [pNo=" + pNo + ", pName=" + pName + ", price=" + price + ", description=" + description
				+ ", pStock=" + pStock + ", pCategory=" + pCategory + ", pBrand=" + pBrand + ", pModel=" + pModel
				+ ", pThumbUrl=" + pThumbUrl + ", pSales=" + pSales + ", ptotal=" + ptotal + ", adStatus=" + adStatus
				+ ", adContent=" + adContent + ", adPoint=" + adPoint + "]";
	}
	
}
