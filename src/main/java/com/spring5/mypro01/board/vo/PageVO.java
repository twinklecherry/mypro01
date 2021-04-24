package com.spring5.mypro01.board.vo;

public class PageVO {

	private int startPage;	//시작 페이징 번호
	private int endPage;	//끝 페이징 번호
	private boolean prev;
	private boolean next;
	private int total;		//전체행개수
	private PagingVO paVO;	//현재페이지번호, 행개수
	
	private int realEnd;
	private int pagingNumCnt; //기본페이지 번호 개수
	
	public PageVO(PagingVO paVO, int total) {
		this.total = total;
		this.paVO = paVO;
		this.pagingNumCnt = 10;
		
		System.out.println("paVO : " + paVO.toString());
		
		this.endPage = (int)(Math.ceil(paVO.getPageNum() / (this.pagingNumCnt * 1.0))) * this.pagingNumCnt;
		System.out.println("endPage : " + this.endPage);
		
		this.startPage = this.endPage - (this.pagingNumCnt - 1);
		System.out.println("startPage : " + this.startPage);
		
		this.realEnd = (int)(Math.ceil((total * 1.0) / paVO.getAmount()));
		System.out.println("realEnd : " + realEnd);
	
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		this.realEnd = this.realEnd;
	}
	
	//getter
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public boolean getPrev() {
		return prev;
	}
	public boolean getNext() {
		return next;
	}
	public int getTotal() {
		return total;
	}
	public PagingVO getPaVO() {
		return paVO;
	}
	public int getRealEnd() {
		return realEnd;
	}
	public int getPagingNumCnt() {
		return pagingNumCnt;
	}
	@Override
	public String toString() {
		return "PageVO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", paVO=" + paVO + ", realEnd=" + realEnd + ", pagingNumCnt=" + pagingNumCnt
				+ "]";
	}

}
