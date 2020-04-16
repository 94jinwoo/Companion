package com.bit.companion.model.entity.mypage;

import java.sql.Date;

public class MyReviewVo {
	private String board_id;
	private String article_id;
	private String member_id;
	private String article_title;
	private String article_content;
	private Date article_date;
	private String article_count;
	private String article_image;
	private String article_thumb;
	private String product_id;
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
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
	public String getArticle_count() {
		return article_count;
	}
	public void setArticle_count(String article_count) {
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
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	@Override
	public String toString() {
		return "MyReviewVo [board_id=" + board_id + ", article_id=" + article_id + ", member_id=" + member_id
				+ ", article_title=" + article_title + ", article_content=" + article_content + ", article_date="
				+ article_date + ", article_count=" + article_count + ", article_image=" + article_image
				+ ", article_thumb=" + article_thumb + ", product_id=" + product_id + "]";
	}
	
	public MyReviewVo() {}
}
