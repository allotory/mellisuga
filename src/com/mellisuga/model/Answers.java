package com.mellisuga.model;

import java.sql.Timestamp;

public class Answers {

	private int id;
	
	private int question_id;
	
	private int author_id;
	
	private String answers;
	
	private Timestamp answer_date;
	
	private int reply_num;
	
	private int is_top_answer;
	
	private int is_anonymous;

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

	public int getAuthor_id() {
		return author_id;
	}

	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}

	public String getAnswers() {
		return answers;
	}

	public void setAnswers(String answers) {
		this.answers = answers;
	}

	public Timestamp getAnswer_date() {
		return answer_date;
	}

	public void setAnswer_date(Timestamp answer_date) {
		this.answer_date = answer_date;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public int getIs_top_answer() {
		return is_top_answer;
	}

	public void setIs_top_answer(int is_top_answer) {
		this.is_top_answer = is_top_answer;
	}

	public int getIs_anonymous() {
		return is_anonymous;
	}

	public void setIs_anonymous(int is_anonymous) {
		this.is_anonymous = is_anonymous;
	}
}
