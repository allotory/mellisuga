package com.mellisuga.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.MessageGroupDAO;
import com.mellisuga.dao.MessageLogDAO;
import com.mellisuga.dao.MessageTextDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Member;
import com.mellisuga.model.MessageGroup;
import com.mellisuga.model.MessageLog;
import com.mellisuga.model.MessageText;
import com.mellisuga.security.Salt;

@WebServlet("/NewPrivateMsgServlet")
public class NewPrivateMsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NewPrivateMsgServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		

		int m_id = Integer.parseInt(request.getParameter("m_id"));
		String msgContent = request.getParameter("msgContent");
		Member m = (Member) request.getSession().getAttribute("member");
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();

			// 更新日期
			Date date = new Date();
			String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(date);
			Timestamp now = Timestamp.valueOf(dateFormate);
			
			System.out.println(m_id);
			System.out.println(msgContent);
			
			MessageTextDAO messageTextDAO = session.getMapper(MessageTextDAO.class);
			MessageText messageText = new MessageText();
			messageText.setContent(msgContent);
			messageText.setMessage_name(Salt.getSalt());
			messageTextDAO.insertMessageText(messageText);
			
			MessageGroupDAO messageGroupDAO = session.getMapper(MessageGroupDAO.class);
			MessageGroup messageGroup = new MessageGroup();
			messageGroup.setMember_id(m_id);
			messageGroupDAO.insertMessageGroup(messageGroup);
			
			session.commit();
			
			// 插入消息日志
			MessageLogDAO messageLogDAO = session.getMapper(MessageLogDAO.class);
			MessageLog messageLog = new MessageLog();
			messageLog.setSender_id(m.getId());
			messageLog.setReceiver_id(m_id);
			messageLog.setText_id(messageText.getId());
			messageLog.setSend_time(now);
			messageLog.setRead_time(now);
			messageLog.setMessage_type("PrivateMsg");
			messageLog.setSender_isdel(0);
			messageLog.setReceiver_isdel(0);
			messageLog.setIs_read(0);
			messageLog.setMessage_group_id(messageGroup.getId());
			messageLogDAO.insertMessageLog(messageLog);
			
			session.commit();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

}
