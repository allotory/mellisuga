package com.mellisuga.dao;

import java.util.HashMap;

import com.mellisuga.model.Follow;

public interface FollowDAO {

	// 插入关注
	public void insertFollow(Follow follow);
	
	// 由问题ID和用户ID查询关注
	public Follow queryFollowByQMid(HashMap<String, Object> parameterMap);
	
	// 删除关注
	public void deleteFollowById(int id);
}
