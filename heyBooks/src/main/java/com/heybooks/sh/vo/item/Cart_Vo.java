package com.heybooks.sh.vo.item;

import java.sql.Date;

public class Cart_Vo {
	private int cart_item_num;
	private int members_num;
	private int product_num;
	private int cart_item_quantity;
	private Date cart_item_date;
	public Cart_Vo() {}
	public Cart_Vo(int cart_item_num, int members_num, int product_num, int cart_item_quantity, Date cart_item_date) {
		super();
		this.cart_item_num = cart_item_num;
		this.members_num = members_num;
		this.product_num = product_num;
		this.cart_item_quantity = cart_item_quantity;
		this.cart_item_date = cart_item_date;
	}
	public int getCart_item_num() {
		return cart_item_num;
	}
	public void setCart_item_num(int cart_item_num) {
		this.cart_item_num = cart_item_num;
	}
	public int getMembers_num() {
		return members_num;
	}
	public void setMembers_num(int members_num) {
		this.members_num = members_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getCart_item_quantity() {
		return cart_item_quantity;
	}
	public void setCart_item_quantity(int cart_item_quantity) {
		this.cart_item_quantity = cart_item_quantity;
	}
	public Date getCart_item_date() {
		return cart_item_date;
	}
	public void setCart_item_date(Date cart_item_date) {
		this.cart_item_date = cart_item_date;
	}
	@Override
	public String toString() {
		return "Cart_Vo [cart_item_num=" + cart_item_num + ", members_num=" + members_num + ", product_num="
				+ product_num + ", cart_item_quantity=" + cart_item_quantity + ", cart_item_date=" + cart_item_date
				+ "]";
	}
	
}