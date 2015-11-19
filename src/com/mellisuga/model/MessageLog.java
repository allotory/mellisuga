package com.mellisuga.model;

import java.sql.Timestamp;

public class MessageLog {

	private int id;
	
	private int receiver_id;
	
	private int text_id;
	
	private int receiver_isdel;
	
	private Timestamp read_time;
	
	private int is_read;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(int receiver_id) {
		this.receiver_id = receiver_id;
	}

	public int getText_id() {
		return text_id;
	}

	public void setText_id(int text_id) {
		this.text_id = text_id;
	}

	public int getReceiver_isdel() {
		return receiver_isdel;
	}

	public void setReceiver_isdel(int receiver_isdel) {
		this.receiver_isdel = receiver_isdel;
	}

	public Timestamp getRead_time() {
		return read_time;
	}

	public void setRead_time(Timestamp read_time) {
		this.read_time = read_time;
	}

	public int getIs_read() {
		return is_read;
	}

	public void setIs_read(int is_read) {
		this.is_read = is_read;
	}
}
