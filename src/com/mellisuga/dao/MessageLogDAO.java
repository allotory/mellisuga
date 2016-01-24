package com.mellisuga.dao;

import java.util.HashMap;
import java.util.List;

import com.mellisuga.model.MessageLog;

public interface MessageLogDAO {

	// 插入消息
	public void insertMessageLog(MessageLog messageLog);
	
	// 判断公共消息是否存在
	public int isExistInMessageLog(HashMap<String, Object> parameterMap);
	
	// 判断系统消息是否存在
	public int isSysExistInMessageLog(HashMap<String, Object> parameterMap);
	
	// 查询所有未读消息数量
	public int queryUnreadMessageByReceiverId(int receiver_id);

	// 查询所有未读消息
	public List<MessageLog> queryMessageLogByReceiverId(int receiver_id);
	
	// 更新
	public void updateMessageLog(MessageLog messageLog);
	
	// 由接收者、消息类型以及消息分组查询消息
	public MessageLog queryMessageLogByIdTypeGroup(HashMap<String, Object> parameterMap);

	// 由接收者、消息以及消息类型查询消息
	public MessageLog queryMessageLogByIdTextType(HashMap<String, Object> parameterMap);

	// 查询所有未读消息（不包括 NewAnswerMsg 和 SystemNotice）
	public int queryBasicUnreadByReceiverId(int receiver_id);
}
