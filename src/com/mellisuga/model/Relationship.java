package com.mellisuga.model;

public class Relationship {

	private int id;
	
	private int member_id;
	
	private int followee_id;
	
	private int follower_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getFollowee_id() {
		return followee_id;
	}

	public void setFollowee_id(int followee_id) {
		this.followee_id = followee_id;
	}

	public int getFollower_id() {
		return follower_id;
	}

	public void setFollower_id(int follower_id) {
		this.follower_id = follower_id;
	}
	
}
