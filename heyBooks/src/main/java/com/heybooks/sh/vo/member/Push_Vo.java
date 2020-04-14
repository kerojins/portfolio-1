package com.heybooks.sh.vo.member;

import java.util.Date;

public class Push_Vo {
	private int push_num;
	private int admin_num;
	private int push_ref; 
	private String push_category;
	private String push_content;
	private Date push_date;
	public Push_Vo() {}
	public Push_Vo(int push_num, int push_ref, int admin_num, String push_category, String push_content,
			Date push_date) {
		super();
		this.push_num = push_num;
		this.push_ref = push_ref;
		this.admin_num = admin_num;
		this.push_category = push_category;
		this.push_content = push_content;
		this.push_date = push_date;
	}
	public int getPush_num() {
		return push_num;
	}
	public void setPush_num(int push_num) {
		this.push_num = push_num;
	}
	public int getPush_ref() {
		return push_ref;
	}
	public void setPush_ref(int push_ref) {
		this.push_ref = push_ref;
	}
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public String getPush_category() {
		return push_category;
	}
	public void setPush_category(String push_category) {
		this.push_category = push_category;
	}
	public String getPush_content() {
		return push_content;
	}
	public void setPush_content(String push_content) {
		this.push_content = push_content;
	}
	public Date getPush_date() {
		return push_date;
	}
	public void setPush_date(Date push_date) {
		this.push_date = push_date;
	}
	@Override
	public String toString() {
		return "Push_Vo [push_num=" + push_num + ", push_ref=" + push_ref + ", admin_num=" + admin_num
				+ ", push_category=" + push_category + ", push_content=" + push_content + ", push_date=" + push_date
				+ "]";
	}
}
