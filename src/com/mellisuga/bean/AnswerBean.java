package com.mellisuga.bean;

import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;

public class AnswerBean {

	private Answers answer;
	
	private Member member;

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
}
