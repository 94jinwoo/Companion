package com.bit.companion.model.entity.order;

public class SessionVo {
	private int product_id;
	private String product_name;
	private String product_image;
	private String product_thumb;
	private int category_id;
	
	public SessionVo() {
	}

	@Override
	public String toString() {
		return "SessionVo [product_id=" + product_id + ", product_name=" + product_name + ", product_image="
				+ product_image + ", product_thumb=" + product_thumb + ", category_id=" + category_id + "]";
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getProduct_thumb() {
		return product_thumb;
	}
	public void setProduct_thumb(String product_thumb) {
		this.product_thumb = product_thumb;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	
	public SessionVo(int product_id, String product_name, String product_image, String product_thumb, int category_id) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_image = product_image;
		this.product_thumb = product_thumb;
		this.category_id = category_id;
	}
	
	
	
	
}
