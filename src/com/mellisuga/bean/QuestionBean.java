package com.mellisuga.bean;

import java.util.List;

import com.mellisuga.model.Question;
import com.mellisuga.model.Tag;
import com.mellisuga.model.Vote;

public class QuestionBean {

	private Question question;
	
	private List<Tag> tagList;
	
	private List<AnswerBean> answerBeanList;
	
	private Vote vote;

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public List<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}

	public List<AnswerBean> getAnswerBeanList() {
		return answerBeanList;
	}

	public void setAnswerBeanList(List<AnswerBean> answerBeanList) {
		this.answerBeanList = answerBeanList;
	}

	public Vote getVote() {
		return vote;
	}

	public void setVote(Vote vote) {
		this.vote = vote;
	}

}
