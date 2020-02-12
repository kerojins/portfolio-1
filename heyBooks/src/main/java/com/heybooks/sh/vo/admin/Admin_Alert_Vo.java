package com.heybooks.sh.vo.admin;

import java.util.Date;

public class Admin_Alert_Vo {
	private int admin_alert_num;
	private int admin_num;
	private int admin_alert_type;
	private String admin_alert_content;
	private Date admin_alert_date;
	public Admin_Alert_Vo() {}
	public Admin_Alert_Vo(int admin_alert_num, int admin_num, int admin_alert_type, String admin_alert_content,
			Date admin_alert_date) {
		super();
		this.admin_alert_num = admin_alert_num;
		this.admin_num = admin_num;
		this.admin_alert_type = admin_alert_type;
		this.admin_alert_content = admin_alert_content;
		this.admin_alert_date = admin_alert_date;
	}
	public int getAdmin_alert_num() {
		return admin_alert_num;
	}
	public void setAdmin_alert_num(int admin_alert_num) {
		this.admin_alert_num = admin_alert_num;
	}
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public int getAdmin_alert_type() {
		return admin_alert_type;
	}
	public void setAdmin_alert_type(int admin_alert_type) {
		this.admin_alert_type = admin_alert_type;
	}
	public String getAdmin_alert_content() {
		return admin_alert_content;
	}
	public void setAdmin_alert_content(String admin_alert_content) {
		this.admin_alert_content = admin_alert_content;
	}
	public Date getAdmin_alert_date() {
		return admin_alert_date;
	}
	public void setAdmin_alert_date(Date admin_alert_date) {
		this.admin_alert_date = admin_alert_date;
	}
	@Override
	public String toString() {
		return "Admin_Alert_Vo [admin_alert_num=" + admin_alert_num + ", admin_num=" + admin_num + ", admin_alert_type="
				+ admin_alert_type + ", admin_alert_content=" + admin_alert_content + ", admin_alert_date="
				+ admin_alert_date + "]";
	}
	
}
