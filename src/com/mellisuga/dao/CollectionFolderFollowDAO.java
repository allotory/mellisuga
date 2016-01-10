package com.mellisuga.dao;

import java.util.HashMap;

import com.mellisuga.model.CollectionFolderFollow;

public interface CollectionFolderFollowDAO {

	public void insertCollectionFolderFollow(CollectionFolderFollow collectionFolderFollow);
	
	public CollectionFolderFollow queryCollectionFolderFollowById(HashMap<String, Object> parameterMap);
	
	public void deleteCollectionFolderFollow(CollectionFolderFollow collectionFolderFollow);
	
	// 判断是否存在
	public int isExistInCollectionFolderFollow(HashMap<String, Object> parameterMap);
}
