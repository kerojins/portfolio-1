package com.heybooks.sh.vo.board;

import java.util.Date;

public class Counsel_Vo {
	private int counsel_num;
	private int members_num;
	private String counsel_type;
	private String  counsel_title;
	private String counsel_content;
	private String counsel_answer;
	private Date counsel_date; 
	public Counsel_Vo() {}
	public Counsel_Vo(int counsel_num, int members_num, String counsel_type, String counsel_title,
			String counsel_content, String counsel_answer, Date counsel_date) {
		super();
		this.counsel_num = counsel_num;
		this.members_num = members_num;
		this.counsel_type = counsel_type;
		this.counsel_title = counsel_title;
		this.counsel_content = counsel_content;
		this.counsel_answer = counsel_answer;
		this.counsel_date = counsel_date;
	}
	public int getCounsel_num() {
		return counsel_num;
	}
	public void setCounsel_num(int counsel_num) {
		this.counsel_num = counsel_num;
	}
	public int getMembers_num() {
		return members_num;
	}
	public void setMembers_num(int members_num) {
		this.members_num = members_num;
	}
	public String getCounsel_type() {
		return counsel_type;
	}
	public void setCounsel_type(String counsel_type) {
		this.counsel_type = counsel_type;
	}
	public String getCounsel_title() {
		return counsel_title;
	}
	public void setCounsel_title(String counsel_title) {
		this.counsel_title = counsel_title;
	}
	public String getCounsel_content() {
		return counsel_content;
	}
	public void setCounsel_content(String counsel_content) {
		this.counsel_content = counsel_content;
	}
	public String getCounsel_answer() {
		return counsel_answer;
	}
	public void setCounsel_answer(String counsel_answer) {
		this.counsel_answer = counsel_answer;
	}
	public Date getCounsel_date() {
		return counsel_date;
	}
	public void setCounsel_date(Date counsel_date) {
		this.counsel_date = counsel_date;
	}
	@Override
	public String toString() {
		return "Counsel_Vo [counsel_num=" + counsel_num + ", members_num=" + members_num + ", counsel_type="
				+ counsel_type + ", counsel_title=" + counsel_title + ", counsel_content=" + counsel_content
				+ ", counsel_answer=" + counsel_answer + ", counsel_date=" + counsel_date + "]";
	}
}
