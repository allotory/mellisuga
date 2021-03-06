package com.mellisuga.bean;

import com.github.pagehelper.PageInfo;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;
import com.mellisuga.model.Trends;
import com.mellisuga.model.Vote;

public class TrendsBean {

	private Trends trends;
	
	private Question question;
	
	private Answers answer;
	
	private Member member;
	
	private Member trendsMember;
	
	private Vote vote;
	
	private VoterBean voterBean;
	
	private boolean isFollowing;
	
	private boolean isThanked;
	
	private boolean isNoHelp;
	
	@SuppressWarnings("rawtypes")
	private PageInfo pageInfo;

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

	public Member getTrendsMember() {
		return trendsMember;
	}

	public void setTrendsMember(Member trendsMember) {
		this.trendsMember = trendsMember;
	}

	public VoterBean getVoterBean() {
		return voterBean;
	}

	public void setVoterBean(VoterBean voterBean) {
		this.voterBean = voterBean;
	}

	public Vote getVote() {
		return vote;
	}

	public void setVote(Vote vote) {
		this.vote = vote;
	}

	public boolean isFollowing() {
		return isFollowing;
	}

	public void setFollowing(boolean isFollowing) {
		this.isFollowing = isFollowing;
	}

	public boolean isThanked() {
		return isThanked;
	}

	public void setThanked(boolean isThanked) {
		this.isThanked = isThanked;
	}

	public boolean isNoHelp() {
		return isNoHelp;
	}

	public void setNoHelp(boolean isNoHelp) {
		this.isNoHelp = isNoHelp;
	}

	@SuppressWarnings("rawtypes")
	public PageInfo getPageInfo() {
		return pageInfo;
	}

	@SuppressWarnings("rawtypes")
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
}
