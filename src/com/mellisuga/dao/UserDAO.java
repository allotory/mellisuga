package com.mellisuga.dao;

import com.mellisuga.model.User;

public interface UserDAO {

	// 添加用户
	public void addUser(User user);
	
	// 通过用户名查找用户
	public User findUserByName(User user);
}
