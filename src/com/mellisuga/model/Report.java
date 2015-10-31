package com.mellisuga.model;

public class Report {

	private int id;
	
	private int report_type_id;
	
	private int report_category;
	
	private int report_category_id;
	
	private int member_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getReport_type_id() {
		return report_type_id;
	}

	public void setReport_type_id(int report_type_id) {
		this.report_type_id = report_type_id;
	}

	public int getReport_category() {
		return report_category;
	}

	public void setReport_category(int report_category) {
		this.report_category = report_category;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getReport_category_id() {
		return report_category_id;
	}

	public void setReport_category_id(int report_category_id) {
		this.report_category_id = report_category_id;
	}
	
}
