package com.mellisuga.bean;

import com.mellisuga.model.Comment;
import com.mellisuga.model.Member;

public class CommentBean {

	private Member member;
	
	private Comment comment;

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}
	
}
