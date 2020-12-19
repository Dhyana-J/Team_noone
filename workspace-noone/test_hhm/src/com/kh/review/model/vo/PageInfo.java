package com.kh.review.model.vo;

public class PageInfo {
	private int listCount;
	private int currentPage;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public PageInfo() {
		
	}

	public PageInfo(int listCount, int currentPage, int maxPage, int startPage, int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage +
				", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
}