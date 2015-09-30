package com.mellisuga.dao;

import java.util.List;

import com.mellisuga.model.Answers;
import com.mellisuga.model.Question;

public interface AnswersDAO {

	// 插入答案
	public void insertAnswer(Answers answers);
	
	// 由问题ID查询答案
	public List<Answers> queryAnswerByQuestionId(Question question);
}
