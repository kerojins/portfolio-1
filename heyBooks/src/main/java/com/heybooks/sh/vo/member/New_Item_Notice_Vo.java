package com.heybooks.sh.vo.member;

import java.util.Date;

public class New_Item_Notice_Vo {
	private int new_item_notice_num;
	private int members_num;
	private int editor_num;
	private Date new_item_notice_date;
	public New_Item_Notice_Vo() {}
	public New_Item_Notice_Vo(int new_item_notice_num, int members_num, int editor_num, Date new_item_notice_date) {
		super();
		this.new_item_notice_num = new_item_notice_num;
		this.members_num = members_num;
		this.editor_num = editor_num;
		this.new_item_notice_date = new_item_notice_date;
	}
	public int getNew_item_notice_num() {
		return new_item_notice_num;
	}
	public void setNew_item_notice_num(int new_item_notice_num) {
		this.new_item_notice_num = new_item_notice_num;
	}
	public int getMembers_num() {
		return members_num;
	}
	public void setMembers_num(int members_num) {
		this.members_num = members_num;
	}
	public int getEditor_num() {
		return editor_num;
	}
	public void setEditor_num(int editor_num) {
		this.editor_num = editor_num;
	}
	public Date getNew_item_notice_date() {
		return new_item_notice_date;
	}
	public void setNew_item_notice_date(Date new_item_notice_date) {
		this.new_item_notice_date = new_item_notice_date;
	}
	@Override
	public String toString() {
		return "New_Item_Notice_Vo [new_item_notice_num=" + new_item_notice_num + ", members_num=" + members_num
				+ ", editor_num=" + editor_num + ", new_item_notice_date=" + new_item_notice_date + "]";
	}
	
}
