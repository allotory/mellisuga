package com.mellisuga.dao;

import java.util.List;

import com.mellisuga.model.Question;

public interface QuestionDAO {

	// 添加问题
	public void insertQuestion(Question question);
	
	// 通过问题和用户ID查询问题详情
	public Question queryQuestionByQUid(Question question);
	
	// 通过问题ID查询问题
	public Question queryQuestionById(Question question);
	
	// 更新问题
	public void updateQuestion(Question question);
	
	// 由提问用户查询问题后三条
	public List<Question> query3QuestionByMid(int member_id);
	
	// 由提问用户查询全部问题
	public List<Question> queryQuestionByMid(int member_id);
	
}
