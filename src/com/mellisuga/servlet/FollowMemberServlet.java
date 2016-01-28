package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.mellisuga.dao.RelationshipDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Member;
import com.mellisuga.model.MessageGroup;
import com.mellisuga.model.MessageLog;
import com.mellisuga.model.MessageText;
import com.mellisuga.model.Relationship;

@WebServlet("/FollowMemberServlet")
public class FollowMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FollowMemberServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		Member m = (Member) request.getSession().getAttribute("member");
		int followee_id = Integer.parseInt(request.getParameter("member_id"));
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 插入关注
			RelationshipDAO relationshipDAO = session.getMapper(RelationshipDAO.class);
			Relationship relationship = new Relationship();
			relationship.setMember_id(m.getId());
			relationship.setFollowee_id(followee_id);
			relationshipDAO.insertRelationship(relationship);
			
			// 当前日期
			Date date = new Date();
			String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(date);
			Timestamp now = Timestamp.valueOf(dateFormate);
			
			// 插入消息
			// 消息组
			MessageGroupDAO messageGroupDAO = session.getMapper(MessageGroupDAO.class);
			MessageGroup messageGroup = new MessageGroup();
			messageGroup.setMember_id(m.getId());
			messageGroupDAO.insertMessageGroup(messageGroup);
			session.commit();
			// 查询消息内容
			MessageTextDAO messageTextDAO = session.getMapper(MessageTextDAO.class);
			//MessageText messageText = messageTextDAO.queryMessageTextByContent("关注了你");
			MessageText messageText = messageTextDAO.queryMessageTextByName("FollowingYouMsg");
			// 插入消息日志
			MessageLogDAO messageLogDAO = session.getMapper(MessageLogDAO.class);
			MessageLog messageLog = new MessageLog();
			messageLog.setSender_id(0);
			messageLog.setReceiver_id(followee_id);
			messageLog.setText_id(messageText.getId());
			messageLog.setSend_time(now);
			messageLog.setRead_time(now);
			messageLog.setMessage_type("FollowingYouMsg");
			messageLog.setSender_isdel(0);
			messageLog.setReceiver_isdel(0);
			messageLog.setIs_read(0);
			messageLog.setMessage_group_id(messageGroup.getId());

			messageLogDAO.insertMessageLog(messageLog);
			
			session.commit();
		} catch(Exception e) {
			e.printStackTrace();
			out.print("followmembererror");
		} finally {
			DBConnection.closeSession(session);
		}
		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
