package com.bit.companion.model.entity.mypage;

import java.sql.Date;

public class MyPurchaseListVo {
	/* order table */
	private String order_id;
	private String member_id;
	private Date order_date;
	private String order_amount;
	private String order_name;
	private String order_tel;
	private String order_phone;
	private String order_addr1;
	private String order_addr2;
	private String order_addr3;
	private String order_msg;
	private String order_state_id;
	/* order_state table */
	private String order_state_member;
	
	public MyPurchaseListVo() {
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(String order_amount) {
		this.order_amount = order_amount;
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_tel() {
		return order_tel;
	}

	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}

	public String getOrder_phone() {
		return order_phone;
	}

	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}

	public String getOrder_addr1() {
		return order_addr1;
	}

	public void setOrder_addr1(String order_addr1) {
		this.order_addr1 = order_addr1;
	}

	public String getOrder_addr2() {
		return order_addr2;
	}

	public void setOrder_addr2(String order_addr2) {
		this.order_addr2 = order_addr2;
	}

	public String getOrder_addr3() {
		return order_addr3;
	}

	public void setOrder_addr3(String order_addr3) {
		this.order_addr3 = order_addr3;
	}

	public String getOrder_msg() {
		return order_msg;
	}

	public void setOrder_msg(String order_msg) {
		this.order_msg = order_msg;
	}

	public String getOrder_state_id() {
		return order_state_id;
	}

	public void setOrder_state_id(String order_state_id) {
		this.order_state_id = order_state_id;
	}

	public String getOrder_state_member() {
		return order_state_member;
	}

	public void setOrder_state_member(String order_state_member) {
		this.order_state_member = order_state_member;
	}

	@Override
	public String toString() {
		return "MyPurchaseListVo [order_id=" + order_id + ", member_id=" + member_id + ", order_date=" + order_date
				+ ", order_amount=" + order_amount + ", order_name=" + order_name + ", order_tel=" + order_tel
				+ ", order_phone=" + order_phone + ", order_addr1=" + order_addr1 + ", order_addr2=" + order_addr2
				+ ", order_addr3=" + order_addr3 + ", order_msg=" + order_msg + ", order_state_id=" + order_state_id
				+ ", order_state_member=" + order_state_member + "]";
	}
	
	
}
