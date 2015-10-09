package com.mellisuga.model;

public class Vote {

	private int id;
	
	private int answer_id;
	
	private int voter_id;
	
	private String vote_type;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAnswer_id() {
		return answer_id;
	}

	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}

	public int getVoter_id() {
		return voter_id;
	}

	public void setVoter_id(int voter_id) {
		this.voter_id = voter_id;
	}

	public String getVote_type() {
		return vote_type;
	}

	public void setVote_type(String vote_type) {
		this.vote_type = vote_type;
	}
	
}
