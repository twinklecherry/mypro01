package com.spring5.mypro01.board.vo;

public class PagingVO {

	private int pageNum;
	private int amount;
	
	public PagingVO() {
		this(1,10);		//test 1-10페이지
	}
	
	public PagingVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "PagingVO [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
