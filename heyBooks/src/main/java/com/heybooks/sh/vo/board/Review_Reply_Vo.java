package com.heybooks.sh.vo.board;

import java.util.Date;

public class Review_Reply_Vo {
	private int review_reply_num;
	private int review_num;
	private int members_num;
	private String review_reply_content;
	private Date review_reply_date;
	public Review_Reply_Vo() {}
	public Review_Reply_Vo(int review_reply_num, int review_num, int members_num, String review_reply_content,
			Date review_reply_date) {
		super();
		this.review_reply_num = review_reply_num;
		this.review_num = review_num;
		this.members_num = members_num;
		this.review_reply_content = review_reply_content;
		this.review_reply_date = review_reply_date;
	}
	public int getReview_reply_num() {
		return review_reply_num;
	}
	public void setReview_reply_num(int review_reply_num) {
		this.review_reply_num = review_reply_num;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getMembers_num() {
		return members_num;
	}
	public void setMembers_num(int members_num) {
		this.members_num = members_num;
	}
	public String getReview_reply_content() {
		return review_reply_content;
	}
	public void setReview_reply_content(String review_reply_content) {
		this.review_reply_content = review_reply_content;
	}
	public Date getReview_reply_date() {
		return review_reply_date;
	}
	public void setReview_reply_date(Date review_reply_date) {
		this.review_reply_date = review_reply_date;
	}
	@Override
	public String toString() {
		return "Review_Reply_Vo [review_reply_num=" + review_reply_num + ", review_num=" + review_num + ", members_num="
				+ members_num + ", review_reply_content=" + review_reply_content + ", review_reply_date="
				+ review_reply_date + "]";
	}
	
}	
