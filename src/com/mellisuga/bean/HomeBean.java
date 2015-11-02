package com.mellisuga.bean;

import java.util.List;

import com.mellisuga.model.Member;
import com.mellisuga.model.Question;
import com.mellisuga.model.Trends;

public class HomeBean {

	private Member member;
	
	private List<Question> questionList;
	
	private List<AnswerBean> answerBeanList;
	
	private List<Trends> trendsList;

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public List<Question> getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}

	public List<AnswerBean> getAnswerBeanList() {
		return answerBeanList;
	}

	public void setAnswerBeanList(List<AnswerBean> answerBeanList) {
		this.answerBeanList = answerBeanList;
	}

	public List<Trends> getTrendsList() {
		return trendsList;
	}

	public void setTrendsList(List<Trends> trendsList) {
		this.trendsList = trendsList;
	}
	
}
