package com.mellisuga.dao;

import java.util.List;

import com.mellisuga.model.CollectionFolder;

public interface CollectionFolderDAO {

	// 插入收藏夹
	public void insertCollectionFolder(CollectionFolder collectionFolder);
	
	// 由用户id查询全部收藏夹
	public List<CollectionFolder> queryCollectionFolderByMid(int id);
	
	// 由id查询收藏夹
	public CollectionFolder queryCollectionFolderById(int id);
	
	// 更新收藏夹
	public void updateCollectionFolder(CollectionFolder collectionFolder);
}
