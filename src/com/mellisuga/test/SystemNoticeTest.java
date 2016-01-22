package com.mellisuga.test;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.MessageTextDAO;
import com.mellisuga.dao.PublicMessageDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.MessageText;
import com.mellisuga.model.PublicMessage;

public class SystemNoticeTest {

	public static void main(String[] args) {

		SqlSession session = null;
		
		try {
			session = DBConnection.openDefaultSession();
			
			Date date = new Date();
			String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(date);
			Timestamp now = Timestamp.valueOf(dateFormate);
			
			// 插入系统公告
			MessageTextDAO messageTextDAO = session.getMapper(MessageTextDAO.class);
			MessageText messageText = new MessageText();
			messageText.setContent("为庆祝世界和平，全体放假一天！");
			messageTextDAO.insertMessageText(messageText);
			session.commit();
			
			PublicMessageDAO publicMessageDAO = session.getMapper(PublicMessageDAO.class);
			PublicMessage publicMessage = new PublicMessage();
			publicMessage.setText_id(messageText.getId());
			publicMessage.setSend_time(now);
			publicMessage.setMessage_type("SystemNotice");
			publicMessage.setMessage_group_id(0);
			publicMessageDAO.insertPublicMessage(publicMessage);
			session.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

}
