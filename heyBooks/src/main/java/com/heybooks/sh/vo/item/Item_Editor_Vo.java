package com.heybooks.sh.vo.item;

import java.util.Date;

public class Item_Editor_Vo {
	
	private int editor_num;
	private String editor_name;
	private String editor_birth;
	private String editor_nation;
	private String editor_introduce;
	private String editor_school;
	private String editor_award;
	private Date editor_date;
	public Item_Editor_Vo() {}
	public Item_Editor_Vo(int editor_num, String editor_name, String editor_birth, String editor_nation,
			String editor_introduce, String editor_school, String editor_award, Date editor_date) {
		super();
		this.editor_num = editor_num; 
		this.editor_name = editor_name;
		this.editor_birth = editor_birth;
		this.editor_nation = editor_nation;
		this.editor_introduce = editor_introduce;
		this.editor_school = editor_school;
		this.editor_award = editor_award;
		this.editor_date = editor_date;
	}
	public int getEditor_num() {
		return editor_num;
	}
	public void setEditor_num(int editor_num) {
		this.editor_num = editor_num;
	}
	public String getEditor_name() {
		return editor_name;
	}
	public void setEditor_name(String editor_name) {
		this.editor_name = editor_name;
	}
	public String getEditor_birth() {
		return editor_birth;
	}
	public void setEditor_birth(String editor_birth) {
		this.editor_birth = editor_birth;
	}
	public String getEditor_nation() {
		return editor_nation;
	}
	public void setEditor_nation(String editor_nation) {
		this.editor_nation = editor_nation;
	}
	public String getEditor_introduce() {
		return editor_introduce;
	}
	public void setEditor_introduce(String editor_introduce) {
		this.editor_introduce = editor_introduce;
	}
	public String getEditor_school() {
		return editor_school;
	}
	public void setEditor_school(String editor_school) {
		this.editor_school = editor_school;
	}
	public String getEditor_award() {
		return editor_award;
	}
	public void setEditor_award(String editor_award) {
		this.editor_award = editor_award;
	}
	public Date getEditor_date() {
		return editor_date;
	}
	public void setEditor_date(Date editor_date) {
		this.editor_date = editor_date;
	}
	@Override
	public String toString() {
		return "Item_Editor_Vo [editor_num=" + editor_num + ", editor_name=" + editor_name + ", editor_birth="
				+ editor_birth + ", editor_nation=" + editor_nation + ", editor_introduce=" + editor_introduce
				+ ", editor_school=" + editor_school + ", editor_award=" + editor_award + ", editor_date=" + editor_date
				+ "]";
	}
	
	
}
