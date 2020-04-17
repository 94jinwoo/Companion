package com.bit.companion.model.entity.order;

import java.util.Date;

public class OrderReviewVo {
	private int board_id;
	private int article_id;
	private String member_id;
	private String article_title;
	private String article_content;
	private Date article_date;
	private int article_count;
	private String article_image;
	private String article_thumb;
	private int product_id;
	private String board_type;
	private String product_name;
	private String product_option1;
	private String product_option2;
	private String product_option3;
	private String product_option4;
	private String product_option5;
	
	public OrderReviewVo() {
	}
	
	public OrderReviewVo(int board_id, int article_id, String member_id, String article_title, String article_content,
			Date article_date, int article_count, String article_image, String article_thumb, int product_id,
			String board_type, String product_name, String product_option1, String product_option2,
			String product_option3, String product_option4, String product_option5) {
		super();
		this.board_id = board_id;
		this.article_id = article_id;
		this.member_id = member_id;
		this.article_title = article_title;
		this.article_content = article_content;
		this.article_date = article_date;
		this.article_count = article_count;
		this.article_image = article_image;
		this.article_thumb = article_thumb;
		this.product_id = product_id;
		this.board_type = board_type;
		this.product_name = product_name;
		this.product_option1 = product_option1;
		this.product_option2 = product_option2;
		this.product_option3 = product_option3;
		this.product_option4 = product_option4;
		this.product_option5 = product_option5;
	}

	@Override
	public String toString() {
		return "OrderReviewVo [board_id=" + board_id + ", article_id=" + article_id + ", member_id=" + member_id
				+ ", article_title=" + article_title + ", article_content=" + article_content + ", article_date="
				+ article_date + ", article_count=" + article_count + ", article_image=" + article_image
				+ ", article_thumb=" + article_thumb + ", product_id=" + product_id + ", board_type=" + board_type
				+ ", product_name=" + product_name + ", product_option1=" + product_option1 + ", product_option2="
				+ product_option2 + ", product_option3=" + product_option3 + ", product_option4=" + product_option4
				+ ", product_option5=" + product_option5 + "]";
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}

	public Date getArticle_date() {
		return article_date;
	}

	public void setArticle_date(Date article_date) {
		this.article_date = article_date;
	}

	public int getArticle_count() {
		return article_count;
	}

	public void setArticle_count(int article_count) {
		this.article_count = article_count;
	}

	public String getArticle_image() {
		return article_image;
	}

	public void setArticle_image(String article_image) {
		this.article_image = article_image;
	}

	public String getArticle_thumb() {
		return article_thumb;
	}

	public void setArticle_thumb(String article_thumb) {
		this.article_thumb = article_thumb;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_option1() {
		return product_option1;
	}

	public void setProduct_option1(String product_option1) {
		this.product_option1 = product_option1;
	}

	public String getProduct_option2() {
		return product_option2;
	}

	public void setProduct_option2(String product_option2) {
		this.product_option2 = product_option2;
	}

	public String getProduct_option3() {
		return product_option3;
	}

	public void setProduct_option3(String product_option3) {
		this.product_option3 = product_option3;
	}

	public String getProduct_option4() {
		return product_option4;
	}

	public void setProduct_option4(String product_option4) {
		this.product_option4 = product_option4;
	}

	public String getProduct_option5() {
		return product_option5;
	}

	public void setProduct_option5(String product_option5) {
		this.product_option5 = product_option5;
	}

}