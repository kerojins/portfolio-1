package com.heybooks.sh.vo.admin;

import java.sql.Date;

public class Admin_Vo {
	private int admin_num; //������ ��ȣ
	private String admin_id; //������ ���̵�
	private String admin_password; //������ ��й�ȣ
	private Date regdate; //������ ������
	public Admin_Vo() {}
	public Admin_Vo(int admin_num, String admin_id, String admin_password, Date regdate) {
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
	
	@Override
	public String toString() {
		return "Admin_Login_Vo [admin_num=" + admin_num + ", admin_id=" + admin_id + ", admin_password="
				+ admin_password + ", regdate=" + regdate + "]";
	}
	
	
		
}
