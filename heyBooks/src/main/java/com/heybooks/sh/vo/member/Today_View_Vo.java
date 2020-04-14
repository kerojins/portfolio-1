package com.heybooks.sh.vo.member;

import java.util.Date;

public class Today_View_Vo {
	private int today_view_num;
	private int members_num;
	private int product_num;
	private Date today_view_date;
	public Today_View_Vo() {}
	public Today_View_Vo(int today_view_num, int members_num, int product_num, Date today_view_date) {
		super();
		this.today_view_num = today_view_num;
		this.members_num = members_num;
		this.product_num = product_num;
		this.today_view_date = today_view_date;
	}
	public int getToday_view_num() {
		return today_view_num;
	}
	public void setToday_view_num(int today_view_num) {
		this.today_view_num = today_view_num;
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
	public Date getToday_view_date() {
		return today_view_date;
	}
	public void setToday_view_date(Date today_view_date) {
		this.today_view_date = today_view_date;
	}
	@Override
	public String toString() {
		return "Today_View_Vo [today_view_num=" + today_view_num + ", members_num=" + members_num + ", product_num="
				+ product_num + ", today_view_date=" + today_view_date + "]";
	}
	
}
