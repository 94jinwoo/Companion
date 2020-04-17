package com.bit.companion.model.entity.order;

import java.util.Date;

public class OrderQuestionVo {
	private int question_id;
	private int question_type_id;
	private int order_id;
	private int product_id;
	private String member_id;
	private Date question_date;
	private Date question_answerdate;
	private String question_title;
	private String question_content;
	private String question_image;
	private String question_answer;
	private int question_secret_id;
	private int question_state_id;
	private String question_type_name;
	private String question_state_name;
	private String question_secret_name;
	private String product_name;
	
	public OrderQuestionVo() {
	}

	public OrderQuestionVo(int question_id, int question_type_id, int order_id, int product_id, String member_id,
			Date question_date, Date question_answerdate, String question_title, String question_content,
			String question_image, String question_answer, int question_secret_id, int question_state_id,
			String question_type_name, String question_state_name, String question_secret_name, String product_name) {
		super();
		this.question_id = question_id;
		this.question_type_id = question_type_id;
		this.order_id = order_id;
		this.product_id = product_id;
		this.member_id = member_id;
		this.question_date = question_date;
		this.question_answerdate = question_answerdate;
		this.question_title = question_title;
		this.question_content = question_content;
		this.question_image = question_image;
		this.question_answer = question_answer;
		this.question_secret_id = question_secret_id;
		this.question_state_id = question_state_id;
		this.question_type_name = question_type_name;
		this.question_state_name = question_state_name;
		this.question_secret_name = question_secret_name;
		this.product_name = product_name;
	}

	@Override
	public String toString() {
		return "OrderQuestionVo [question_id=" + question_id + ", question_type_id=" + question_type_id + ", order_id="
				+ order_id + ", product_id=" + product_id + ", member_id=" + member_id + ", question_date="
				+ question_date + ", question_answerdate=" + question_answerdate + ", question_title=" + question_title
				+ ", question_content=" + question_content + ", question_image=" + question_image + ", question_answer="
				+ question_answer + ", question_secret_id=" + question_secret_id + ", question_state_id="
				+ question_state_id + ", question_type_name=" + question_type_name + ", question_state_name="
				+ question_state_name + ", question_secret_name=" + question_secret_name + ", product_name="
				+ product_name + "]";
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public int getQuestion_type_id() {
		return question_type_id;
	}

	public void setQuestion_type_id(int question_type_id) {
		this.question_type_id = question_type_id;
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

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getQuestion_date() {
		return question_date;
	}

	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}

	public Date getQuestion_answerdate() {
		return question_answerdate;
	}

	public void setQuestion_answerdate(Date question_answerdate) {
		this.question_answerdate = question_answerdate;
	}

	public String getQuestion_title() {
		return question_title;
	}

	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}

	public String getQuestion_content() {
		return question_content;
	}

	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}

	public String getQuestion_image() {
		return question_image;
	}

	public void setQuestion_image(String question_image) {
		this.question_image = question_image;
	}

	public String getQuestion_answer() {
		return question_answer;
	}

	public void setQuestion_answer(String question_answer) {
		this.question_answer = question_answer;
	}

	public int getQuestion_secret_id() {
		return question_secret_id;
	}

	public void setQuestion_secret_id(int question_secret_id) {
		this.question_secret_id = question_secret_id;
	}

	public int getQuestion_state_id() {
		return question_state_id;
	}

	public void setQuestion_state_id(int question_state_id) {
		this.question_state_id = question_state_id;
	}

	public String getQuestion_type_name() {
		return question_type_name;
	}

	public void setQuestion_type_name(String question_type_name) {
		this.question_type_name = question_type_name;
	}

	public String getQuestion_state_name() {
		return question_state_name;
	}

	public void setQuestion_state_name(String question_state_name) {
		this.question_state_name = question_state_name;
	}

	public String getQuestion_secret_name() {
		return question_secret_name;
	}

	public void setQuestion_secret_name(String question_secret_name) {
		this.question_secret_name = question_secret_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	
}
