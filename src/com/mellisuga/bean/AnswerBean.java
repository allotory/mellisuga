package com.mellisuga.bean;

import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Vote;

public class AnswerBean {

	private Answers answer;
	
	private Member member;

	private Vote vote;
	
	private VoterBean voterBean;
	
	private boolean is_thank;
	
	public Answers getAnswer() {
		return answer;
	}

	public void setAnswer(Answers answer) {
		this.answer = answer;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Vote getVote() {
		return vote;
	}

	public void setVote(Vote vote) {
		this.vote = vote;
	}

	public VoterBean getVoterBean() {
		return voterBean;
	}

	public void setVoterBean(VoterBean voterBean) {
		this.voterBean = voterBean;
	}

	public boolean isIs_thank() {
		return is_thank;
	}

	public void setIs_thank(boolean is_thank) {
		this.is_thank = is_thank;
	}
	
}
