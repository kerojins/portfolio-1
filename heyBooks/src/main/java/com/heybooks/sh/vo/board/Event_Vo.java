package com.heybooks.sh.vo.board;

import java.util.Date;

public class Event_Vo {
	private int event_num;
	private int admin_num;
	private String event_title;
	private String event_content;
	private String event_period;
	private String event_thumbnail;
	private int event_hit; 
	private Date event_date;
	public Event_Vo() {}
	public Event_Vo(int event_num, int admin_num, String event_title, String event_content, String event_period,
			String event_thumbnail, int event_hit, Date event_date) {
		super();
		this.event_num = event_num;
		this.admin_num = admin_num;
		this.event_title = event_title;
		this.event_content = event_content;
		this.event_period = event_period;
		this.event_thumbnail = event_thumbnail;
		this.event_hit = event_hit;
		this.event_date = event_date;
	}
	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public String getEvent_period() {
		return event_period;
	}
	public void setEvent_period(String event_period) {
		this.event_period = event_period;
	}
	public String getEvent_thumbnail() {
		return event_thumbnail;
	}
	public void setEvent_thumbnail(String event_thumbnail) {
		this.event_thumbnail = event_thumbnail;
	}
	public int getEvent_hit() {
		return event_hit;
	}
	public void setEvent_hit(int event_hit) {
		this.event_hit = event_hit;
	}
	public Date getEvent_date() {
		return event_date;
	}
	public void setEvent_date(Date event_date) {
		this.event_date = event_date;
	}
	@Override
	public String toString() {
		return "Event_Vo [event_num=" + event_num + ", admin_num=" + admin_num + ", event_title=" + event_title
				+ ", event_content=" + event_content + ", event_period=" + event_period + ", event_thumbnail="
				+ event_thumbnail + ", event_hit=" + event_hit + ", event_date=" + event_date + "]";
	}
	
	
}
