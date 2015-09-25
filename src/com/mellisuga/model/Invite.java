package com.mellisuga.model;

public class Invite {

	private int id;
	
	private int question_id;
	
	private int inviter_id;
	
	private int invitee_id;

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

	public int getInviter_id() {
		return inviter_id;
	}

	public void setInviter_id(int inviter_id) {
		this.inviter_id = inviter_id;
	}

	public int getInvitee_id() {
		return invitee_id;
	}

	public void setInvitee_id(int invitee_id) {
		this.invitee_id = invitee_id;
	}
}
