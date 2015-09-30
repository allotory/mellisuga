package com.mellisuga.dao;

import com.mellisuga.model.Question;

public interface QuestionDAO {

	// 添加问题
	public void insertQuestion(Question question);
	
	// 通过问题和用户ID查询问题详情
	public Question queryQuestionByQUid(Question question);
	
	// 通过问题ID查询问题
	public Question queryQuestionById(Question question);
}
