package com.mellisuga.bean;

import java.util.List;

import com.mellisuga.model.Member;

public class VoterBean {

	private int upCount;
	
	private List<Member> voterList;

	public int getUpCount() {
		return upCount;
	}

	public void setUpCount(int upCount) {
		this.upCount = upCount;
	}

	public List<Member> getVoterList() {
		return voterList;
	}

	public void setVoterList(List<Member> voterList) {
		this.voterList = voterList;
	}
	
}
