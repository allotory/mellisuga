package com.mellisuga.model;

import java.sql.Timestamp;

public class Question {

	private int id;
	
	private String question_title;
	
	private String question_content;
	
	private int answers_num;
	
	private int followers_num;
	
	private Timestamp last_updated;
	
	private int scan_num;
	
	private int reply_num;
	
	private int is_anonymous;
	
	private int member_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuestion_title() {
		return question_title;
	}

	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}

	public String getQuestion_content() {
		return question_content;
	}

	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}

	public int getAnswers_num() {
		return answers_num;
	}

	public void setAnswers_num(int answers_num) {
		this.answers_num = answers_num;
	}

	public int getFollowers_num() {
		return followers_num;
	}

	public void setFollowers_num(int followers_num) {
		this.followers_num = followers_num;
	}

	public Timestamp getLast_updated() {
		return last_updated;
	}

	public void setLast_updated(Timestamp last_updated) {
		this.last_updated = last_updated;
	}

	public int getScan_num() {
		return scan_num;
	}

	public void setScan_num(int scan_num) {
		this.scan_num = scan_num;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
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
