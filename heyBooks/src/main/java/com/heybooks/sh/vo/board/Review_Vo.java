package com.heybooks.sh.vo.board;

import java.util.Date;

public class Review_Vo {
	private int review_num;
	private int product_num;
	private int members_num;
	private String review_content;
	private int review_grade;
	private int review_recommend; 
	private int review_report; 
	private String review_spoiler;
	private Date review_date;
	public Review_Vo() {}
	public Review_Vo(int review_num, int product_num, int members_num, String review_content, int review_grade,
			int review_recommend, int review_report, String review_spoiler, Date review_date) {
		super();
		this.review_num = review_num;
		this.product_num = product_num;
		this.members_num = members_num;
		this.review_content = review_content;
		this.review_grade = review_grade;
		this.review_recommend = review_recommend;
		this.review_report = review_report;
		this.review_spoiler = review_spoiler;
		this.review_date = review_date;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getMembers_num() {
		return members_num;
	}
	public void setMembers_num(int members_num) {
		this.members_num = members_num;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_grade() {
		return review_grade;
	}
	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}
	public int getReview_recommend() {
		return review_recommend;
	}
	public void setReview_recommend(int review_recommend) {
		this.review_recommend = review_recommend;
	}
	public int getReview_report() {
		return review_report;
	}
	public void setReview_report(int review_report) {
		this.review_report = review_report;
	}
	public String getReview_spoiler() {
		return review_spoiler;
	}
	public void setReview_spoiler(String review_spoiler) {
		this.review_spoiler = review_spoiler;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	@Override
	public String toString() {
		return "Review_Vo [review_num=" + review_num + ", product_num=" + product_num + ", members_num=" + members_num
				+ ", review_content=" + review_content + ", review_grade=" + review_grade + ", review_recommend="
				+ review_recommend + ", review_report=" + review_report + ", review_spoiler=" + review_spoiler
				+ ", review_date=" + review_date + "]";
	}
	
	
	
}
