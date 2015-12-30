package com.mellisuga.dao;

import java.util.HashMap;
import java.util.List;

import com.mellisuga.model.Collection;

public interface CollectionDAO {

	// 插入答案收藏
	public void insertCollection(Collection collection);
	
	// 由答案及收藏夹id查询答案是否被收藏
	public Collection queryCollectionByACid(HashMap<String, Object> parameterMap);
	
	// 有答案及收藏夹id删除答案
	public void deleteCollectionByACid(HashMap<String, Object> parameterMap);

	// 由收藏夹id查询所有答案id
	public List<Collection> queryAnswerIdByFolderId(int collectionFolderId);
}
