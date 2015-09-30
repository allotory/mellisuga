package com.mellisuga.bean;

import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;
import com.mellisuga.model.Trends;

public class TrendsBean {

	private Trends trends;
	
	private Question question;
	
	private Answers answer;
	
	private Member member;

	public Trends getTrends() {
		return trends;
	}

	public void setTrends(Trends trends) {
		this.trends = trends;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

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
