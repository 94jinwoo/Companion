package com.bit.companion.model.entity.admin;

import java.sql.Date;

public class AdminOrderVo {
	private int order_id;
	private int order_state_id;
	private String member_id;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_tel;
	private int order_amount;
	private String order_name;
	private String order_phone;
	private String order_tel;
	private Date order_date;
	private String order_msg;
	private String order_state_admin;
	private String order_addr1;
	private String order_addr2;
	private String order_addr3;
	private String delivery_company;
	private String delivery_number;
	private String delivery_state_name;
	private Date payment_date;
	private int payment_amount;
	private String payment_state_name;
	
	public AdminOrderVo() {}

	public AdminOrderVo(int order_id, int order_state_id, String member_id, String member_name, String member_email,
			String member_phone, String member_tel, int order_amount, String order_name, String order_phone,
			String order_tel, Date order_date, String order_msg, String order_state_admin, String order_addr1,
			String order_addr2, String order_addr3, String delivery_company, String delivery_number,
			String delivery_state_name, Date payment_date, int payment_amount, String payment_state_name) {
		super();
		this.order_id = order_id;
		this.order_state_id = order_state_id;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_tel = member_tel;
		this.order_amount = order_amount;
		this.order_name = order_name;
		this.order_phone = order_phone;
		this.order_tel = order_tel;
		this.order_date = order_date;
		this.order_msg = order_msg;
		this.order_state_admin = order_state_admin;
		this.order_addr1 = order_addr1;
		this.order_addr2 = order_addr2;
		this.order_addr3 = order_addr3;
		this.delivery_company = delivery_company;
		this.delivery_number = delivery_number;
		this.delivery_state_name = delivery_state_name;
		this.payment_date = payment_date;
		this.payment_amount = payment_amount;
		this.payment_state_name = payment_state_name;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getOrder_state_id() {
		return order_state_id;
	}

	public void setOrder_state_id(int order_state_id) {
		this.order_state_id = order_state_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public int getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_phone() {
		return order_phone;
	}

	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}

	public String getOrder_tel() {
		return order_tel;
	}

	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_msg() {
		return order_msg;
	}

	public void setOrder_msg(String order_msg) {
		this.order_msg = order_msg;
	}

	public String getOrder_state_admin() {
		return order_state_admin;
	}

	public void setOrder_state_admin(String order_state_admin) {
		this.order_state_admin = order_state_admin;
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

	public String getDelivery_company() {
		return delivery_company;
	}

	public void setDelivery_company(String delivery_company) {
		this.delivery_company = delivery_company;
	}

	public String getDelivery_number() {
		return delivery_number;
	}

	public void setDelivery_number(String delivery_number) {
		this.delivery_number = delivery_number;
	}

	public String getDelivery_state_name() {
		return delivery_state_name;
	}

	public void setDelivery_state_name(String delivery_state_name) {
		this.delivery_state_name = delivery_state_name;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public int getPayment_amount() {
		return payment_amount;
	}

	public void setPayment_amount(int payment_amount) {
		this.payment_amount = payment_amount;
	}

	public String getPayment_state_name() {
		return payment_state_name;
	}

	public void setPayment_state_name(String payment_state_name) {
		this.payment_state_name = payment_state_name;
	}

	@Override
	public String toString() {
		return "AdminOrderVo [order_id=" + order_id + ", order_state_id=" + order_state_id + ", member_id=" + member_id
				+ ", member_name=" + member_name + ", member_email=" + member_email + ", member_phone=" + member_phone
				+ ", member_tel=" + member_tel + ", order_amount=" + order_amount + ", order_name=" + order_name
				+ ", order_phone=" + order_phone + ", order_tel=" + order_tel + ", order_date=" + order_date
				+ ", order_msg=" + order_msg + ", order_state_admin=" + order_state_admin + ", order_addr1="
				+ order_addr1 + ", order_addr2=" + order_addr2 + ", order_addr3=" + order_addr3 + ", delivery_company="
				+ delivery_company + ", delivery_number=" + delivery_number + ", delivery_state_name="
				+ delivery_state_name + ", payment_date=" + payment_date + ", payment_amount=" + payment_amount
				+ ", payment_state_name=" + payment_state_name + "]";
	}
	
}
