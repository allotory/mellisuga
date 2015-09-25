package com.mellisuga.model;

import java.sql.Timestamp;

public class Draft {

	private int id;
	
	private String draft_title;
	
	private String draft_content;
	
	private Timestamp last_updated;
	
	private int is_anonymous;
	
	private int member_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDraft_title() {
		return draft_title;
	}

	public void setDraft_title(String draft_title) {
		this.draft_title = draft_title;
	}

	public String getDraft_content() {
		return draft_content;
	}

	public void setDraft_content(String draft_content) {
		this.draft_content = draft_content;
	}

	public Timestamp getLast_updated() {
		return last_updated;
	}

	public void setLast_updated(Timestamp last_updated) {
		this.last_updated = last_updated;
	}

	public int getIs_anonymous() {
		return is_anonymous;
	}

	public void setIs_anonymous(int is_anonymous) {
		this.is_anonymous = is_anonymous;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	
}
