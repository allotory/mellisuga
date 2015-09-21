package com.mellisuga.model;

import java.sql.Timestamp;

public class Qlog {

	private int id;
	
	private int question_id;
	
	private int member_id;
	
	private String event;
	
	private Timestamp log_date;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	public Timestamp getLog_date() {
		return log_date;
	}

	public void setLog_date(Timestamp log_date) {
		this.log_date = log_date;
	}
	
}
