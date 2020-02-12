package com.heybooks.sh.vo.item;

import java.sql.Date;

import org.springframework.core.annotation.Order;

public class Order_Item_Vo {
	private int order_item_num;
	private int product_num;
	private int order_num;
	private String order_item_name;
	private String order_item_quantity;
	private String order_item_price;
	private Date order_item_date;
	public Order_Item_Vo() {}
	public Order_Item_Vo(int order_item_num, int product_num, int order_num, String order_item_name,
			String order_item_quantity, String order_item_price, Date order_item_date) {
		super();
		this.order_item_num = order_item_num;
		this.product_num = product_num;
		this.order_num = order_num;
		this.order_item_name = order_item_name;
		this.order_item_quantity = order_item_quantity;
		this.order_item_price = order_item_price;
		this.order_item_date = order_item_date;
	}
	public int getOrder_item_num() {
		return order_item_num;
	}
	public void setOrder_item_num(int order_item_num) {
		this.order_item_num = order_item_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getOrder_item_name() {
		return order_item_name;
	}
	public void setOrder_item_name(String order_item_name) {
		this.order_item_name = order_item_name;
	}
	public String getOrder_item_quantity() {
		return order_item_quantity;
	}
	public void setOrder_item_quantity(String order_item_quantity) {
		this.order_item_quantity = order_item_quantity;
	}
	public String getOrder_item_price() {
		return order_item_price;
	}
	public void setOrder_item_price(String order_item_price) {
		this.order_item_price = order_item_price;
	}
	public Date getOrder_item_date() {
		return order_item_date;
	}
	public void setOrder_item_date(Date order_item_date) {
		this.order_item_date = order_item_date;
	}
	@Override
	public String toString() {
		return "Order_Item_Vo [order_item_num=" + order_item_num + ", product_num=" + product_num + ", order_num="
				+ order_num + ", order_item_name=" + order_item_name + ", order_item_quantity=" + order_item_quantity
				+ ", order_item_price=" + order_item_price + ", order_item_date=" + order_item_date + "]";
	}
} 
