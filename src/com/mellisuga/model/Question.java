package com.mellisuga.model;

import java.sql.Timestamp;

public class Question {

	private int id;
	
	private String question_title;
	
	private String question_content;
	
	private int answer_num;
	
	private int followers_num;
	
	private Timestamp last_updated;
	
	private int scan_num;
	
	private int replay_num;

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

	public int getAnswer_num() {
		return answer_num;
	}

	public void setAnswer_num(int answer_num) {
		this.answer_num = answer_num;
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

	public int getReplay_num() {
		return replay_num;
	}

	public void setReplay_num(int replay_num) {
		this.replay_num = replay_num;
	}
	
}
