package com.mellisuga.bean;

import com.mellisuga.model.CollectionFolder;
import com.mellisuga.model.Member;

public class CollectionFolderBean {

	private CollectionFolder collectionFolder;
	
	private Member member;
	
	private boolean isCollected;

	public CollectionFolder getCollectionFolder() {
		return collectionFolder;
	}

	public void setCollectionFolder(CollectionFolder collectionFolder) {
		this.collectionFolder = collectionFolder;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public boolean isCollected() {
		return isCollected;
	}

	public void setCollected(boolean isCollected) {
		this.isCollected = isCollected;
	}
	
}
