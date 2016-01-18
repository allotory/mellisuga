package com.mellisuga.dao;

import com.mellisuga.model.MessageGroup;

public interface MessageGroupDAO {

	public void insertMessageGroup(MessageGroup messageGroup);
	
	public MessageGroup queryMessageGroupByid(int id);
}
