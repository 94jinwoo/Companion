package com.bit.companion.model.entity.mypage;

import java.sql.Date;

public class MyPurchaseDetailVo {
	/* order_detail table */
	private String order_detail_id;
	private String order_id;
	private String product_id;
	private String order_detail_price;
	private String order_detail_quantity;
	private String order_detail_option;
	/* product table */
	private String product_thumb;
	private String product_name;
	/* order table */
	private Date order_date;
	/* order_state table */
	private String order_state_member;
	
	public MyPurchaseDetailVo() {
	}

	public String getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(String order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getOrder_detail_price() {
		return order_detail_price;
	}

	public void setOrder_detail_price(String order_detail_price) {
		this.order_detail_price = order_detail_price;
	}

	public String getOrder_detail_quantity() {
		return order_detail_quantity;
	}

	public void setOrder_detail_quantity(String order_detail_quantity) {
		this.order_detail_quantity = order_detail_quantity;
	}

	public String getOrder_detail_option() {
		return order_detail_option;
	}

	public void setOrder_detail_option(String order_detail_option) {
		this.order_detail_option = order_detail_option;
	}

	public String getProduct_thumb() {
		return product_thumb;
	}

	public void setProduct_thumb(String product_thumb) {
		this.product_thumb = product_thumb;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getOrder_state_member() {
		return order_state_member;
	}

	public void setOrder_state_member(String order_state_member) {
		this.order_state_member = order_state_member;
	}

	@Override
	public String toString() {
		return "MyPurchaseDetailVo [order_detail_id=" + order_detail_id + ", order_id=" + order_id + ", product_id="
				+ product_id + ", order_detail_price=" + order_detail_price + ", order_detail_quantity="
				+ order_detail_quantity + ", order_detail_option=" + order_detail_option + ", product_thumb="
				+ product_thumb + ", product_name=" + product_name + ", order_date=" + order_date
				+ ", order_state_member=" + order_state_member + "]";
	}

	
	
	
	
}
