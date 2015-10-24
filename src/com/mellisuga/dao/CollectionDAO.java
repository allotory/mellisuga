package com.mellisuga.dao;

import java.util.HashMap;

import com.mellisuga.model.Collection;

public interface CollectionDAO {

	// 插入答案收藏
	public void insertCollection(Collection collection);
	
	// 由答案及收藏夹id查询答案是否被收藏
	public Collection queryCollectionByACid(HashMap<String, Object> parameterMap);
}
