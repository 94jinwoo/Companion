package com.bit.companion.model.entity.admin;

public class AdminOrderDetailVo {
	private int order_detail_id;
	private int order_id;
	private int product_id;
	private int order_detail_price;
	private int order_detail_quantity;
	private String order_detail_option;
	private String product_name;
	private int product_price;
	
	public AdminOrderDetailVo() {}

	public AdminOrderDetailVo(int order_detail_id, int order_id, int product_id, int order_detail_price,
			int order_detail_quantity, String order_detail_option, String product_name, int product_price) {
		super();
		this.order_detail_id = order_detail_id;
		this.order_id = order_id;
		this.product_id = product_id;
		this.order_detail_price = order_detail_price;
		this.order_detail_quantity = order_detail_quantity;
		this.order_detail_option = order_detail_option;
		this.product_name = product_name;
		this.product_price = product_price;
	}

	public int getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getOrder_detail_price() {
		return order_detail_price;
	}

	public void setOrder_detail_price(int order_detail_price) {
		this.order_detail_price = order_detail_price;
	}

	public int getOrder_detail_quantity() {
		return order_detail_quantity;
	}

	public void setOrder_detail_quantity(int order_detail_quantity) {
		this.order_detail_quantity = order_detail_quantity;
	}

	public String getOrder_detail_option() {
		return order_detail_option;
	}

	public void setOrder_detail_option(String order_detail_option) {
		this.order_detail_option = order_detail_option;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	@Override
	public String toString() {
		return "AdminOrderDetailVo [order_detail_id=" + order_detail_id + ", order_id=" + order_id + ", product_id="
				+ product_id + ", order_detail_price=" + order_detail_price + ", order_detail_quantity="
				+ order_detail_quantity + ", order_detail_option=" + order_detail_option + ", product_name="
				+ product_name + ", product_price=" + product_price + "]";
	}
	
}
