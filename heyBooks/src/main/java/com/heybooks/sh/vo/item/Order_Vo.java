package com.heybooks.sh.vo.item;

import java.util.Date;

public class Order_Vo {
	private int order_num;
	private int members_num;
	private String total_price;
	private String total_count;
	private String total_mileage;
	private String order_name;
	private String order_phone_number;
	private String order_add_number;
	private String order_post;
	private String order_address;
	private String order_detail_address;
	private String order_extra_address;
	private String order_message;
	private String order_shipping_charge;
	private String payment_methods;
	private String order_status;
	private Date order_date; 
	public Order_Vo() {}
	public Order_Vo(int order_num, int members_num, String total_price, String total_count, String total_mileage,
			String order_name, String order_phone_number, String order_add_number, String order_post,
			String order_address, String order_detail_address, String order_extra_address, String order_message,
			String order_shipping_charge, String payment_methods, String order_status, Date order_date) {
		super();
		this.order_num = order_num;
		this.members_num = members_num;
		this.total_price = total_price;
		this.total_count = total_count;
		this.total_mileage = total_mileage;
		this.order_name = order_name;
		this.order_phone_number = order_phone_number;
		this.order_add_number = order_add_number;
		this.order_post = order_post;
		this.order_address = order_address;
		this.order_detail_address = order_detail_address;
		this.order_extra_address = order_extra_address;
		this.order_message = order_message;
		this.order_shipping_charge = order_shipping_charge;
		this.payment_methods = payment_methods;
		this.order_status = order_status;
		this.order_date = order_date;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getMembers_num() {
		return members_num;
	}
	public void setMembers_num(int members_num) {
		this.members_num = members_num;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public String getTotal_count() {
		return total_count;
	}
	public void setTotal_count(String total_count) {
		this.total_count = total_count;
	}
	public String getTotal_mileage() {
		return total_mileage;
	}
	public void setTotal_mileage(String total_mileage) {
		this.total_mileage = total_mileage;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_phone_number() {
		return order_phone_number;
	}
	public void setOrder_phone_number(String order_phone_number) {
		this.order_phone_number = order_phone_number;
	}
	public String getOrder_add_number() {
		return order_add_number;
	}
	public void setOrder_add_number(String order_add_number) {
		this.order_add_number = order_add_number;
	}
	public String getOrder_post() {
		return order_post;
	}
	public void setOrder_post(String order_post) {
		this.order_post = order_post;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_detail_address() {
		return order_detail_address;
	}
	public void setOrder_detail_address(String order_detail_address) {
		this.order_detail_address = order_detail_address;
	}
	public String getOrder_extra_address() {
		return order_extra_address;
	}
	public void setOrder_extra_address(String order_extra_address) {
		this.order_extra_address = order_extra_address;
	}
	public String getOrder_message() {
		return order_message;
	}
	public void setOrder_message(String order_message) {
		this.order_message = order_message;
	}
	public String getOrder_shipping_charge() {
		return order_shipping_charge;
	}
	public void setOrder_shipping_charge(String order_shipping_charge) {
		this.order_shipping_charge = order_shipping_charge;
	}
	public String getPayment_methods() {
		return payment_methods;
	}
	public void setPayment_methods(String payment_methods) {
		this.payment_methods = payment_methods;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	@Override
	public String toString() {
		return "Order_Vo [order_num=" + order_num + ", members_num=" + members_num + ", total_price=" + total_price
				+ ", total_count=" + total_count + ", total_mileage=" + total_mileage + ", order_name=" + order_name
				+ ", order_phone_number=" + order_phone_number + ", order_add_number=" + order_add_number
				+ ", order_post=" + order_post + ", order_address=" + order_address + ", order_detail_address="
				+ order_detail_address + ", order_extra_address=" + order_extra_address + ", order_message="
				+ order_message + ", order_shipping_charge=" + order_shipping_charge + ", payment_methods="
				+ payment_methods + ", order_status=" + order_status + ", order_date=" + order_date + "]";
	}
	
}
