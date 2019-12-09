package com.heybooks.sh.vo.item;

import java.sql.Date;

public class Item_Vo {
	private int product_num;
	private int cate_num;
	private int editor_num;
	private String product_publish;
	private String product_name;
	private int product_page;
	private String product_discription;
	private String product_index;
	private String product_status;
	private String product_view;
	private String product_shipping_charge;
	private String product_discount;
	private String product_price;
	private String product_discount_price;
	private int product_stock;
	private String product_picture;
	private String product_preview;
	private Date product_date;
	public Item_Vo() {}
	public Item_Vo(int product_num, int cate_num, int editor_num, String product_publish, String product_name,
			int product_page, String product_discription, String product_index, String product_status,
			String product_view, String product_shipping_charge, String product_discount, String product_price,
			String product_discount_price, int product_stock, String product_picture, String product_preview,
			Date product_date) {
		super();
		this.product_num = product_num;
		this.cate_num = cate_num;
		this.editor_num = editor_num;
		this.product_publish = product_publish;
		this.product_name = product_name;
		this.product_page = product_page;
		this.product_discription = product_discription;
		this.product_index = product_index;
		this.product_status = product_status;
		this.product_view = product_view;
		this.product_shipping_charge = product_shipping_charge;
		this.product_discount = product_discount;
		this.product_price = product_price;
		this.product_discount_price = product_discount_price;
		this.product_stock = product_stock;
		this.product_picture = product_picture;
		this.product_preview = product_preview;
		this.product_date = product_date;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}
	public int getEditor_num() {
		return editor_num;
	}
	public void setEditor_num(int editor_num) {
		this.editor_num = editor_num;
	}
	public String getProduct_publish() {
		return product_publish;
	}
	public void setProduct_publish(String product_publish) {
		this.product_publish = product_publish;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_page() {
		return product_page;
	}
	public void setProduct_page(int product_page) {
		this.product_page = product_page;
	}
	public String getProduct_discription() {
		return product_discription;
	}
	public void setProduct_discription(String product_discription) {
		this.product_discription = product_discription;
	}
	public String getProduct_index() {
		return product_index;
	}
	public void setProduct_index(String product_index) {
		this.product_index = product_index;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	public String getProduct_view() {
		return product_view;
	}
	public void setProduct_view(String product_view) {
		this.product_view = product_view;
	}
	public String getProduct_shipping_charge() {
		return product_shipping_charge;
	}
	public void setProduct_shipping_charge(String product_shipping_charge) {
		this.product_shipping_charge = product_shipping_charge;
	}
	public String getProduct_discount() {
		return product_discount;
	}
	public void setProduct_discount(String product_discount) {
		this.product_discount = product_discount;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_discount_price() {
		return product_discount_price;
	}
	public void setProduct_discount_price(String product_discount_price) {
		this.product_discount_price = product_discount_price;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_picture() {
		return product_picture;
	}
	public void setProduct_picture(String product_picture) {
		this.product_picture = product_picture;
	}
	public String getProduct_preview() {
		return product_preview;
	}
	public void setProduct_preview(String product_preview) {
		this.product_preview = product_preview;
	}
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	@Override
	public String toString() {
		return "Item_Vo [product_num=" + product_num + ", cate_num=" + cate_num + ", editor_num=" + editor_num
				+ ", product_publish=" + product_publish + ", product_name=" + product_name + ", product_page="
				+ product_page + ", product_discription=" + product_discription + ", product_index=" + product_index
				+ ", product_status=" + product_status + ", product_view=" + product_view + ", product_shipping_charge="
				+ product_shipping_charge + ", product_discount=" + product_discount + ", product_price="
				+ product_price + ", product_discount_price=" + product_discount_price + ", product_stock="
				+ product_stock + ", product_picture=" + product_picture + ", product_preview=" + product_preview
				+ ", product_date=" + product_date + "]";
	}
	
	 
}
