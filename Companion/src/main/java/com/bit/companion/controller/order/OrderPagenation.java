package com.bit.companion.controller.order;

public class OrderPagenation {

	// present page num
	private int num;
	// all board count
	//page.setCount(productService.count(model, category_id));
	private int count;
	
	// page * board num
	private int postNum = 12;
	// paging num ([ all board num ÷ page*board ]의 올림)
	private int pageNum;
	// disply paging
	private int displayPost;
	// paging num
	private int pageNumCnt = 3;
	// last num of paging
	private int endPageNum;
	// first num of paging
	private int startPageNum;
	// next or prev status
	private boolean prev;
	private boolean next;
	
	
	private void dataCalc() {
		
		//lastnum
		endPageNum = (int)(Math.ceil((double)num/(double)pageNumCnt) * pageNumCnt);
		
		System.out.println(endPageNum);
		//start page num
		startPageNum = endPageNum - (pageNumCnt-1);
		
		//last num re calc
		int endPageNum_tmp = (int)(Math.ceil((double)count/(double)pageNumCnt));
		
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		 prev = startPageNum == 1 ? false : true;
		 next = endPageNum * pageNumCnt >= count ? false : true;
		 
		 displayPost = (num - 1) * postNum;
	}
	
	public OrderPagenation() {
	}


	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		dataCalc();
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getDisplayPost() {
		return displayPost;
	}

	public void setDisplayPost(int displayPost) {
		this.displayPost = displayPost;
	}

	public int getPageNumCnt() {
		return pageNumCnt;
	}

	public void setPageNumCnt(int pageNumCnt) {
		this.pageNumCnt = pageNumCnt;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public boolean getPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean getNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}


	
	
	
	
	
	
	
	
}
