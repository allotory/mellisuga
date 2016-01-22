package com.mellisuga.dao;

import java.util.List;

import com.mellisuga.model.PublicMessage;

public interface PublicMessageDAO {

	public void insertPublicMessage(PublicMessage publicMessage);
	
	public List<PublicMessage> queryPublicMessageByTypeTime(String message_type);
}
