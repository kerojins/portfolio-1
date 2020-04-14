package com.heybooks.sh.vo.board;

import java.sql.Clob;
import java.util.Date;

public class Notice_Vo {
	private int notice_num;
	private int admin_num; 
	private String notice_title;
	private String notice_content;
	private int notice_official;
	private int notice_official_detail;
	private String notice_official_date; 
	private int notice_hit;
	private Date notice_date;
	public Notice_Vo() {}
	public Notice_Vo(int notice_num, int admin_num, String notice_title, String notice_content, int notice_official,
			int notice_official_detail, String notice_official_date, int notice_hit, Date notice_date) {
		super();
		this.notice_num = notice_num;
		this.admin_num = admin_num;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_official = notice_official;
		this.notice_official_detail = notice_official_detail;
		this.notice_official_date = notice_official_date;
		this.notice_hit = notice_hit;
		this.notice_date = notice_date;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_official() {
		return notice_official;
	}
	public void setNotice_official(int notice_official) {
		this.notice_official = notice_official;
	}
	public int getNotice_official_detail() {
		return notice_official_detail;
	}
	public void setNotice_official_detail(int notice_official_detail) {
		this.notice_official_detail = notice_official_detail;
	}
	public String getNotice_official_date() {
		return notice_official_date;
	}
	public void setNotice_official_date(String notice_official_date) {
		this.notice_official_date = notice_official_date;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	@Override
	public String toString() {
		return "Notice_Vo [notice_num=" + notice_num + ", admin_num=" + admin_num + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_official=" + notice_official
				+ ", notice_official_detail=" + notice_official_detail + ", notice_official_date="
				+ notice_official_date + ", notice_hit=" + notice_hit + ", notice_date=" + notice_date + "]";
	}
	
}
