package com.mellisuga.dao;

import com.mellisuga.model.User;

public interface UserDAO {

	// ����û�
	public void addUser(User user);
	
	// ͨ���û��������û�
	public User findUserByName(User user);
}
