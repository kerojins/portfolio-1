package com.heybooks.sh.vo;

import java.sql.Date;

public class Admin_Login_Vo {
	private int admin_num;
	private String admin_id;
	private String admin_password;
	private Date regdate;
	public Admin_Login_Vo() {}
	public Admin_Login_Vo(int admin_num, String admin_id, String admin_password, Date regdate) {
		super();
		this.admin_num = admin_num;
		this.admin_id= admin_id;
		this.admin_password = admin_password;
		this.regdate = regdate;
	}
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegDatd(Date regdate) {
		this.regdate = regdate;
	}
		
}
