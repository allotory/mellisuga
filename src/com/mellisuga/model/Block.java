package com.mellisuga.model;

public class Block {

	private int id;
	
	private int member_id;
	
	private int blocked_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getBlocked_id() {
		return blocked_id;
	}

	public void setBlocked_id(int blocked_id) {
		this.blocked_id = blocked_id;
	}
	
}
