package com.mellisuga.dao;

import com.mellisuga.model.MessageText;

public interface MessageTextDAO {

	// 插入消息
	public void insertMessageText(MessageText messageText);
	
	// 由id查询消息
	public MessageText queryMessageTextById(int id);
}
