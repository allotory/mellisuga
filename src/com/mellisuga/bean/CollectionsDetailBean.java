package com.mellisuga.bean;

import java.util.List;

import com.mellisuga.model.CollectionFolder;
import com.mellisuga.model.Member;

public class CollectionsDetailBean {

	private CollectionFolder collectionFolder;
	
	private List<CollectionBean> collectionBeanList;
	
	private boolean isMyCollection;
	
	private Member folderOwner;

	public CollectionFolder getCollectionFolder() {
		return collectionFolder;
	}

	public void setCollectionFolder(CollectionFolder collectionFolder) {
		this.collectionFolder = collectionFolder;
	}

	public List<CollectionBean> getCollectionBeanList() {
		return collectionBeanList;
	}

	public void setCollectionBeanList(List<CollectionBean> collectionBeanList) {
		this.collectionBeanList = collectionBeanList;
	}

	public boolean isMyCollection() {
		return isMyCollection;
	}

	public void setMyCollection(boolean isMyCollection) {
		this.isMyCollection = isMyCollection;
	}

	public Member getFolderOwner() {
		return folderOwner;
	}

	public void setFolderOwner(Member folderOwner) {
		this.folderOwner = folderOwner;
	}

}
