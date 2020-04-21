package com.bit.companion.common;

public class Pagination_C extends Pagination{
	private int category_id;
	private String sort;
	
	public Pagination_C() {
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public Pagination_C(int category_id, String sort) {
		super();
		this.category_id = category_id;
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "Pagination_C [category_id=" + category_id + ", sort=" + sort + "]";
	}
	
}
