package com.mellisuga.model;

import java.sql.Timestamp;

public class Trends {

	private int id;
	
	private int trends_id;
	
	private String trends_type;
	
	private int p_trends_id;
	
	private String p_trends_type;
	
	private Timestamp trends_time;
	
	private int trends_member;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTrends_id() {
		return trends_id;
	}

	public void setTrends_id(int trends_id) {
		this.trends_id = trends_id;
	}

	public String getTrends_type() {
		return trends_type;
	}

	public void setTrends_type(String trends_type) {
		this.trends_type = trends_type;
	}

	public int getP_trends_id() {
		return p_trends_id;
	}

	public void setP_trends_id(int p_trends_id) {
		this.p_trends_id = p_trends_id;
	}

	public String getP_trends_type() {
		return p_trends_type;
	}

	public void setP_trends_type(String p_trends_type) {
		this.p_trends_type = p_trends_type;
	}

	public Timestamp getTrends_time() {
		return trends_time;
	}

	public void setTrends_time(Timestamp trends_time) {
		this.trends_time = trends_time;
	}

	public int getTrends_member() {
		return trends_member;
	}

	public void setTrends_member(int trends_member) {
		this.trends_member = trends_member;
	}
}
