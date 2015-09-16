package com.mellisuga.remote.dao;

import com.mellisuga.remote.model.User;

public interface UserDAO {
	
	// 插入用户
	public void insertUser(User user);
	
	// 查询用户
	public User queryUserByName(User user);
}
