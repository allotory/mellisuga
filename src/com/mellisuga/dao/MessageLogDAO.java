package com.mellisuga.dao;

import java.util.HashMap;

import com.mellisuga.model.MessageLog;

public interface MessageLogDAO {

	public void insertMessageLog(MessageLog messageLog);
	
	public MessageLog queryPublicMessageLog(HashMap<String, Object> parameterMap);
}
