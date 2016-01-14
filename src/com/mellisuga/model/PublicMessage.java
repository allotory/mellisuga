package com.mellisuga.model;

import java.sql.Timestamp;

public class PublicMessage {

	private int id;
	
	private int text_id;
	
	private Timestamp send_time;
	
	private String message_type;
	
	private int message_group_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getText_id() {
		return text_id;
	}

	public void setText_id(int text_id) {
		this.text_id = text_id;
	}

	public Timestamp getSend_time() {
		return send_time;
	}

	public void setSend_time(Timestamp send_time) {
		this.send_time = send_time;
	}

	public String getMessage_type() {
		return message_type;
	}

	public void setMessage_type(String message_type) {
		this.message_type = message_type;
	}

	public int getMessage_group_id() {
		return message_group_id;
	}

	public void setMessage_group_id(int message_group_id) {
		this.message_group_id = message_group_id;
	}
	
}
