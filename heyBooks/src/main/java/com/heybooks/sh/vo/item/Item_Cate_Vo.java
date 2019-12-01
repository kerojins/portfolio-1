package com.heybooks.sh.vo.item;

import java.sql.Date;

public class Item_Cate_Vo {
	
	private int cate_num;
	private String cate_name;
	private String cate_ref1;
	private String cate_ref2;
	private String cate_ref3;
	private int cate_order;
	private Date cate_date; 
	
	public Item_Cate_Vo() {}
	
	public Item_Cate_Vo(int cate_num, String cate_name, String cate_ref1, String cate_ref2, String cate_ref3,
			int cate_order, Date cate_date) {
		super();
		this.cate_num = cate_num;
		this.cate_name = cate_name; 
		this.cate_ref1 = cate_ref1;
		this.cate_ref2 = cate_ref2;
		this.cate_ref3 = cate_ref3;
		this.cate_order = cate_order;
		this.cate_date = cate_date;
	}
	
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getCate_ref1() {
		return cate_ref1;
	}
	public void setCate_ref1(String cate_ref1) {
		this.cate_ref1 = cate_ref1;
	}
	public String getCate_ref2() {
		return cate_ref2;
	}
	public void setCate_ref2(String cate_ref2) {
		this.cate_ref2 = cate_ref2;
	}
	public String getCate_ref3() {
		return cate_ref3;
	}
	public void setCate_ref3(String cate_ref3) {
		this.cate_ref3 = cate_ref3;
	}
	public int getCate_order() {
		return cate_order;
	}
	public void setCate_order(int cate_order) {
		this.cate_order = cate_order;
	}
	public Date getCate_date() {
		return cate_date;
	}
	public void setCate_date(Date cate_date) {
		this.cate_date = cate_date;
	}

	@Override
	public String toString() {
		return "Item_Cate_Vo [cate_num=" + cate_num + ", cate_name=" + cate_name + ", cate_ref1=" + cate_ref1
				+ ", cate_ref2=" + cate_ref2 + ", cate_ref3=" + cate_ref3 + ", cate_order=" + cate_order
				+ ", cate_date=" + cate_date + "]";
	}
	
	
}
