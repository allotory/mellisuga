package com.mellisuga.model;

public class CollectionFolder {

	private int id;
	
	private String foldername;
	
	private int owner_id;
	
	private int answers_num;
	
	private int followers_num;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFoldername() {
		return foldername;
	}

	public void setFoldername(String foldername) {
		this.foldername = foldername;
	}

	public int getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(int owner_id) {
		this.owner_id = owner_id;
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
	
}
