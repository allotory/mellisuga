package com.mellisuga.model;

import java.sql.Timestamp;

public class MessageText {

	private int id;
	
	private int sender_id;
	
	private String content;
	
	private Timestamp send_time;
	
	private int sender_isdel;
	
	private String msg_type;
	
	private int follow_group;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSender_id() {
		return sender_id;
	}

	public void setSender_id(int sender_id) {
		this.sender_id = sender_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getSend_time() {
		return send_time;
	}

	public void setSend_time(Timestamp send_time) {
		this.send_time = send_time;
	}

	public int getSender_isdel() {
		return sender_isdel;
	}

	public void setSender_isdel(int sender_isdel) {
		this.sender_isdel = sender_isdel;
	}

	public String getMsg_type() {
		return msg_type;
	}

	public void setMsg_type(String msg_type) {
		this.msg_type = msg_type;
	}

	public int getFollow_group() {
		return follow_group;
	}

	public void setFollow_group(int follow_group) {
		this.follow_group = follow_group;
	}
	
}
