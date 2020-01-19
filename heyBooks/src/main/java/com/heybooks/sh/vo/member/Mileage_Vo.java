package com.heybooks.sh.vo.member;

import java.sql.Date;

public class Mileage_Vo {
	private int mileage_num;
	private int order_num;
	private int members_num;
	private int mileage_score;
	private int mileage_total;
	private Date mileage_date;
	public Mileage_Vo() {}
	public Mileage_Vo(int mileage_num, int order_num, int members_num, int mileage_score, int mileage_total,
			Date mileage_date) {
		super();
		this.mileage_num = mileage_num;
		this.order_num = order_num;
		this.members_num = members_num;
		this.mileage_score = mileage_score;
		this.mileage_total = mileage_total;
		this.mileage_date = mileage_date;
	}
	public int getMileage_num() {
		return mileage_num;
	}
	public void setMileage_num(int mileage_num) {
		this.mileage_num = mileage_num;
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
	public int getMileage_score() {
		return mileage_score;
	}
	public void setMileage_score(int mileage_score) {
		this.mileage_score = mileage_score;
	}
	public int getMileage_total() {
		return mileage_total;
	}
	public void setMileage_total(int mileage_total) {
		this.mileage_total = mileage_total;
	}
	public Date getMileage_date() {
		return mileage_date;
	}
	public void setMileage_date(Date mileage_date) {
		this.mileage_date = mileage_date;
	}
	@Override
	public String toString() {
		return "Mileage_Vo [mileage_num=" + mileage_num + ", order_num=" + order_num + ", members_num=" + members_num
				+ ", mileage_score=" + mileage_score + ", mileage_total=" + mileage_total + ", mileage_date="
				+ mileage_date + "]";
	}
	
}
