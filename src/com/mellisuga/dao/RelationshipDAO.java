package com.mellisuga.dao;

import java.util.HashMap;

import com.mellisuga.model.Relationship;

public interface RelationshipDAO {

	// 插入
	public void insertRelationship(Relationship relationship);
	
	// 查询是否关注
	public int isExistInRelationship(HashMap<String, Object> parameterMap);
}
