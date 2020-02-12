package com.heybooks.sh.vo.member;

import java.util.Date;

public class Member_Vo {
	private int members_num; // ȸ����ȣ
	private String members_id; // ȸ�� ���̵�
	private String members_password; // ȸ�� ��й�ȣ
	private String members_name; // ȸ�� �̸�
	private String members_years; // ȸ�� �������
	private String members_phone_number; // ȸ�� �ڵ���
	private String members_email; // ȸ�� �̸���
	private String members_gender; // ����
	private String members_post; // �����ȣ
	private String members_address; // �ּ�
	private String members_detail_address; // ���ּ�
	private String members_extra_address; // �ּ� �����׸�
	private String members_add_number; // �߰���ȣ
	private String members_job; // ����
	private String members_favorite; // ���ɺо�
	private String members_status; // ȸ������
	private Date members_regdate; // ������
	
	public Member_Vo() {}

	public Member_Vo(int members_num, String members_id, String members_password, String members_name,
			String members_years, String members_phone_number, String members_email, String members_gender,
			String members_post, String members_address, String members_detail_address, String members_extra_address,
			String members_add_number, String members_job, String members_favorite, String members_status,
			Date members_regdate) {
		super();
		this.members_num = members_num;
		this.members_id = members_id;
		this.members_password = members_password;
		this.members_name = members_name;
		this.members_years = members_years;
		this.members_phone_number = members_phone_number;
		this.members_email = members_email;
		this.members_gender = members_gender;
		this.members_post = members_post;
		this.members_address = members_address;
		this.members_detail_address = members_detail_address;
		this.members_extra_address = members_extra_address;
		this.members_add_number = members_add_number;
		this.members_job = members_job;
		this.members_favorite = members_favorite;
		this.members_status = members_status;
		this.members_regdate = members_regdate;
	}

	public int getMembers_num() {
		return members_num;
	}

	public void setMembers_num(int members_num) {
		this.members_num = members_num;
	}

	public String getMembers_id() {
		return members_id;
	}

	public void setMembers_id(String members_id) {
		this.members_id = members_id;
	}

	public String getMembers_password() {
		return members_password;
	}

	public void setMembers_password(String members_password) {
		this.members_password = members_password;
	}

	public String getMembers_name() {
		return members_name;
	}

	public void setMembers_name(String members_name) {
		this.members_name = members_name;
	}

	public String getMembers_years() {
		return members_years;
	}

	public void setMembers_years(String members_years) {
		this.members_years = members_years;
	}

	public String getMembers_phone_number() {
		return members_phone_number;
	}

	public void setMembers_phone_number(String members_phone_number) {
		this.members_phone_number = members_phone_number;
	}

	public String getMembers_email() {
		return members_email;
	}

	public void setMembers_email(String members_email) {
		this.members_email = members_email;
	}

	public String getMembers_gender() {
		return members_gender;
	}

	public void setMembers_gender(String members_gender) {
		this.members_gender = members_gender;
	}

	public String getMembers_post() {
		return members_post;
	}

	public void setMembers_post(String members_post) {
		this.members_post = members_post;
	}

	public String getMembers_address() {
		return members_address;
	}

	public void setMembers_address(String members_address) {
		this.members_address = members_address;
	}

	public String getMembers_detail_address() {
		return members_detail_address;
	}

	public void setMembers_detail_address(String members_detail_address) {
		this.members_detail_address = members_detail_address;
	}

	public String getMembers_extra_address() {
		return members_extra_address;
	}

	public void setMembers_extra_address(String members_extra_address) {
		this.members_extra_address = members_extra_address;
	}

	public String getMembers_add_number() {
		return members_add_number;
	}

	public void setMembers_add_number(String members_add_number) {
		this.members_add_number = members_add_number;
	}

	public String getMembers_job() {
		return members_job;
	}

	public void setMembers_job(String members_job) {
		this.members_job = members_job;
	}

	public String getMembers_favorite() {
		return members_favorite;
	}

	public void setMembers_favorite(String members_favorite) {
		this.members_favorite = members_favorite;
	}

	public String getMembers_status() {
		return members_status;
	}

	public void setMembers_status(String members_status) {
		this.members_status = members_status;
	}

	public Date getMembers_regdate() {
		return members_regdate;
	}

	public void setMembers_regdate(Date members_regdate) {
		this.members_regdate = members_regdate;
	}

	@Override
	public String toString() {
		return "Member_Vo [members_num=" + members_num + ", members_id=" + members_id + ", members_password="
				+ members_password + ", members_name=" + members_name + ", members_years=" + members_years
				+ ", members_phone_number=" + members_phone_number + ", members_email=" + members_email
				+ ", members_gender=" + members_gender + ", members_post=" + members_post + ", members_address="
				+ members_address + ", members_detail_address=" + members_detail_address + ", members_extra_address="
				+ members_extra_address + ", members_add_number=" + members_add_number + ", members_job=" + members_job
				+ ", members_favorite=" + members_favorite + ", members_status=" + members_status + ", members_regdate="
				+ members_regdate + "]";
	}
	
	 
}
