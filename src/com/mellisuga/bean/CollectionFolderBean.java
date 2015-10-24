package com.mellisuga.bean;

import com.mellisuga.model.CollectionFolder;

public class CollectionFolderBean {

	private CollectionFolder collectionFolder;
	
	private boolean isCollected;

	public CollectionFolder getCollectionFolder() {
		return collectionFolder;
	}

	public void setCollectionFolder(CollectionFolder collectionFolder) {
		this.collectionFolder = collectionFolder;
	}

	public boolean isCollected() {
		return isCollected;
	}

	public void setCollected(boolean isCollected) {
		this.isCollected = isCollected;
	}
	
}
