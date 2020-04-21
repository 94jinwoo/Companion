package com.bit.companion.common;

public class Pagination_P extends Pagination{
	private int product_id;

	public Pagination_P() {
	}
	
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public Pagination_P(int product_id) {
		super();
		this.product_id = product_id;
	}

	@Override
	public String toString() {
		return "Pagination_P [product_id=" + product_id + "]";
	}

}
