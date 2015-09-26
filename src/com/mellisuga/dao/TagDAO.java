package com.mellisuga.dao;

import java.util.List;

import com.mellisuga.model.Question;
import com.mellisuga.model.Tag;

public interface TagDAO {

	// 插入标签
	public void insertTag(Tag tag);
	
	// 查询标签
	public List<Tag> queryTagByQuestionId(Question question);
}
