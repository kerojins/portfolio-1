package com.heybooks.sh.vo.board;

import java.sql.Date;

public class Counsel_Reply_Vo {
	private int counsel_reply_num;
	private int counsel_num;
	private int admin_num;
	private String counsel_reply_content;
	private Date counsel_reply_date;
	public Counsel_Reply_Vo() {}
	public Counsel_Reply_Vo(int counsel_reply_num, int counsel_num, int admin_num, String counsel_reply_content,
			Date counsel_reply_date) {
		super();
		this.counsel_reply_num = counsel_reply_num;
		this.counsel_num = counsel_num;
		this.admin_num = admin_num;
		this.counsel_reply_content = counsel_reply_content;
		this.counsel_reply_date = counsel_reply_date;
	}
	public int getCounsel_reply_num() {
		return counsel_reply_num;
	}
	public void setCounsel_reply_num(int counsel_reply_num) {
		this.counsel_reply_num = counsel_reply_num;
	}
	public int getCounsel_num() {
		return counsel_num;
	}
	public void setCounsel_num(int counsel_num) {
		this.counsel_num = counsel_num;
	}
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public String getCounsel_reply_content() {
		return counsel_reply_content;
	}
	public void setCounsel_reply_content(String counsel_reply_content) {
		this.counsel_reply_content = counsel_reply_content;
	}
	public Date getCounsel_reply_date() {
		return counsel_reply_date;
	}
	public void setCounsel_reply_date(Date counsel_reply_date) {
		this.counsel_reply_date = counsel_reply_date;
	}
	@Override 
	public String toString() {
		return "Counsel_Reply_VO [counsel_reply_num=" + counsel_reply_num + ", counsel_num=" + counsel_num
				+ ", admin_num=" + admin_num + ", counsel_reply_content=" + counsel_reply_content
				+ ", counsel_reply_date=" + counsel_reply_date + "]";
	} 
}
