package com.mellisuga.dao;

import java.util.HashMap;
import java.util.List;

import com.mellisuga.model.MessageLog;

public interface MessageLogDAO {

	// 插入消息
	public void insertMessageLog(MessageLog messageLog);
	
	// 判断是否存在
	public int isExistInMessageLog(HashMap<String, Object> parameterMap);

	// 查询所有未读消息
	public List<MessageLog> queryMessageLogByUnread(HashMap<String, Object> parameterMap);
}
