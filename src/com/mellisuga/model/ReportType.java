package com.mellisuga.model;

public class ReportType {

	private int id;
	
	private String report_type_content;
	
	private int is_common;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReport_type_content() {
		return report_type_content;
	}

	public void setReport_type_content(String report_type_content) {
		this.report_type_content = report_type_content;
	}

	public int getIs_common() {
		return is_common;
	}

	public void setIs_common(int is_common) {
		this.is_common = is_common;
	}
	
}
