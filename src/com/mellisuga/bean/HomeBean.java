package com.mellisuga.bean;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;

public class HomeBean {

	private Member member;
	
	private List<Question> questionList;
	
	private List<AnswerBean> answerBeanList;
	
	private List<TrendsBean> trendsBeanList;
	
	private PageInfo<Question> questionPageInfo;
	
	private PageInfo<Answers> answerPageInfo;
	
	private boolean isFollowing;

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

	public List<TrendsBean> getTrendsBeanList() {
		return trendsBeanList;
	}

	public void setTrendsBeanList(List<TrendsBean> trendsBeanList) {
		this.trendsBeanList = trendsBeanList;
	}

	public PageInfo<Question> getQuestionPageInfo() {
		return questionPageInfo;
	}

	public void setQuestionPageInfo(PageInfo<Question> questionPageInfo) {
		this.questionPageInfo = questionPageInfo;
	}

	public PageInfo<Answers> getAnswerPageInfo() {
		return answerPageInfo;
	}

	public void setAnswerPageInfo(PageInfo<Answers> answerPageInfo) {
		this.answerPageInfo = answerPageInfo;
	}

	public boolean isFollowing() {
		return isFollowing;
	}

	public void setFollowing(boolean isFollowing) {
		this.isFollowing = isFollowing;
	}
	
}
