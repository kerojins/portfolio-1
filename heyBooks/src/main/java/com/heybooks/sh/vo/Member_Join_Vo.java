package com.heybooks.sh.vo;

import java.sql.Date;

public class Member_Join_Vo {
	private int member_num; //회원번호
	private String member_id; //회원 아이디
	private String member_password; //회원 비밀번호
	private String member_name; //회원 이름
	private int member_phone_number; //회원 핸드폰
	private String member_email; //회원 이메일
	private String member_gender; // 성별
	private int member_post; //우편번호
	private String member_address; //주소
	private String member_detail_address; //상세주소
	private String member_extra_address; //주소 참고항목
	private int member_add_number; //추가번호
	private String member_job; //직업
	private String member_favorite; //관심분야
	private Date member_regdate; //가입일
	
	public Member_Join_Vo() {}

	public Member_Join_Vo(int member_num, String member_id, String member_password, String member_name,
			int member_phone_number, String member_email, String member_gender, int member_post, String member_address,
			String member_detail_address, String member_extra_address, int member_add_number, String member_job,
			String member_favorite, Date member_regdate) {
		super();
		this.member_num = member_num;
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_name = member_name;
		this.member_phone_number = member_phone_number;
		this.member_email = member_email;
		this.member_gender = member_gender;
		this.member_post = member_post;
		this.member_address = member_address;
		this.member_detail_address = member_detail_address;
		this.member_extra_address = member_extra_address;
		this.member_add_number = member_add_number;
		this.member_job = member_job;
		this.member_favorite = member_favorite;
		this.member_regdate = member_regdate;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getMember_phone_number() {
		return member_phone_number;
	}

	public void setMember_phone_number(int member_phone_number) {
		this.member_phone_number = member_phone_number;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public int getMember_post() {
		return member_post;
	}

	public void setMember_post(int member_post) {
		this.member_post = member_post;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_detail_address() {
		return member_detail_address;
	}

	public void setMember_detail_address(String member_detail_address) {
		this.member_detail_address = member_detail_address;
	}

	public String getMember_extra_address() {
		return member_extra_address;
	}

	public void setMember_extra_address(String member_extra_address) {
		this.member_extra_address = member_extra_address;
	}

	public int getMember_add_number() {
		return member_add_number;
	}

	public void setMember_add_number(int member_add_number) {
		this.member_add_number = member_add_number;
	}

	public String getMember_job() {
		return member_job;
	}

	public void setMember_job(String member_job) {
		this.member_job = member_job;
	}

	public String getMember_favorite() {
		return member_favorite;
	}

	public void setMember_favorite(String member_favorite) {
		this.member_favorite = member_favorite;
	}

	public Date getMember_regdate() {
		return member_regdate;
	}

	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}

	@Override
	public String toString() {
		return "Member_Join_Vo [member_num=" + member_num + ", member_id=" + member_id + ", member_password="
				+ member_password + ", member_name=" + member_name + ", member_phone_number=" + member_phone_number
				+ ", member_email=" + member_email + ", member_gender=" + member_gender + ", member_post=" + member_post
				+ ", member_address=" + member_address + ", member_detail_address=" + member_detail_address
				+ ", member_extra_address=" + member_extra_address + ", member_add_number=" + member_add_number
				+ ", member_job=" + member_job + ", member_favorite=" + member_favorite + ", member_regdate="
				+ member_regdate + "]";
	}
	
	
}
