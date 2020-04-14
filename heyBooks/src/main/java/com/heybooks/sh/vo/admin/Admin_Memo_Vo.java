package com.heybooks.sh.vo.admin;

import java.util.Date;

public class Admin_Memo_Vo {
	private int admin_memo_num;
	private int admin_num;
	private String admin_memo_content;
	private Date admin_memo_date;
	public Admin_Memo_Vo() {} 
	public Admin_Memo_Vo(int admin_memo_num, int admin_num, String admin_memo_content, Date admin_memo_date) {
		super();
		this.admin_memo_num = admin_memo_num;
		this.admin_num = admin_num;
		this.admin_memo_content = admin_memo_content;
		this.admin_memo_date = admin_memo_date;
	}
	public int getAdmin_memo_num() {
		return admin_memo_num;
	}
	public void setAdmin_memo_num(int admin_memo_num) {
		this.admin_memo_num = admin_memo_num;
	}
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public String getAdmin_memo_content() {
		return admin_memo_content;
	}
	public void setAdmin_memo_content(String admin_memo_content) {
		this.admin_memo_content = admin_memo_content;
	}
	public Date getAdmin_memo_date() {
		return admin_memo_date;
	}
	public void setAdmin_memo_date(Date admin_memo_date) {
		this.admin_memo_date = admin_memo_date;
	}
	@Override
	public String toString() {
		return "Admin_Memo_Vo [admin_memo_num=" + admin_memo_num + ", admin_num=" + admin_num + ", admin_memo_content="
				+ admin_memo_content + ", admin_memo_date=" + admin_memo_date + "]";
	}
	
}
