package com.mellisuga.bean;

import java.util.List;

import com.mellisuga.model.CollectionFolder;

public class CollectionsDetailBean {

	private CollectionFolder collectionFolder;
	
	private List<CollectionBean> collectionBeanList;

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

}
