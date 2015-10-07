package com.mellisuga.dao;

import java.util.List;

import com.mellisuga.model.Comment;

public interface CommentDAO {

	// 插入评论
	public void insertComment(Comment comment);
	
	// 通过问题ID查询评论
	public List<Comment> queryCommentByQuestionId(int question_id);
	
	// 通过答案ID查询评论
	public List<Comment> queryCommentByAnswerId(int answer_id);
}
