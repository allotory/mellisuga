package com.mellisuga.bean;

import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.MessageLog;
import com.mellisuga.model.MessageText;
import com.mellisuga.model.Question;

public class MessageBean {

	private MessageLog messageLog;
	
	private MessageText messageText;
	
	private Question question;
	
	private Answers answers;
	
	private Member member;

	public MessageLog getMessageLog() {
		return messageLog;
	}

	public void setMessageLog(MessageLog messageLog) {
		this.messageLog = messageLog;
	}

	public MessageText getMessageText() {
		return messageText;
	}

	public void setMessageText(MessageText messageText) {
		this.messageText = messageText;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public Answers getAnswers() {
		return answers;
	}

	public void setAnswers(Answers answers) {
		this.answers = answers;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
}
