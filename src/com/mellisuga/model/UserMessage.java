package com.mellisuga.model;

import java.sql.Timestamp;

public class UserMessage {

	private int id;
	
	private int sender_id;
	
	private int receiver_id;
	
	private int text_id;
	
	private int receiver_isdel;
	
	private int sender_isdel;
	
	private Timestamp send_time;
	
	private Timestamp read_time;
	
	private int is_read;
	
	private int mtype;

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

	public int getSender_isdel() {
		return sender_isdel;
	}

	public void setSender_isdel(int sender_isdel) {
		this.sender_isdel = sender_isdel;
	}

	public Timestamp getSend_time() {
		return send_time;
	}

	public void setSend_time(Timestamp send_time) {
		this.send_time = send_time;
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

	public int getMtype() {
		return mtype;
	}

	public void setMtype(int mtype) {
		this.mtype = mtype;
	}
	
}
