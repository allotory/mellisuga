package com.mellisuga.model;

public class CollectionFolderFollow {

	private int id;
	
	private int collection_folder_id;
	
	private int follower_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCollection_folder_id() {
		return collection_folder_id;
	}

	public void setCollection_folder_id(int collection_folder_id) {
		this.collection_folder_id = collection_folder_id;
	}

	public int getFollower_id() {
		return follower_id;
	}

	public void setFollower_id(int follower_id) {
		this.follower_id = follower_id;
	}
	
}
