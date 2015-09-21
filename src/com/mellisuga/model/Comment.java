package com.mellisuga.model;

import java.sql.Timestamp;

public class Comment {

	private int id;
	
	private int question_id;
	
	private int answer_id;
	
	private int reviewer_id;
	
	private int parent_comment_id;
	
	private String content;
	
	private Timestamp comment_date;
	
	private int favour_num;

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

	public int getAnswer_id() {
		return answer_id;
	}

	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}

	public int getReviewer_id() {
		return reviewer_id;
	}

	public void setReviewer_id(int reviewer_id) {
		this.reviewer_id = reviewer_id;
	}

	public int getParent_comment_id() {
		return parent_comment_id;
	}

	public void setParent_comment_id(int parent_comment_id) {
		this.parent_comment_id = parent_comment_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getComment_date() {
		return comment_date;
	}

	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}

	public int getFavour_num() {
		return favour_num;
	}

	public void setFavour_num(int favour_num) {
		this.favour_num = favour_num;
	}
	
}
