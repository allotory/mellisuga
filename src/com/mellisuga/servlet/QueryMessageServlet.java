package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.FollowDAO;
import com.mellisuga.dao.MessageGroupDAO;
import com.mellisuga.dao.MessageLogDAO;
import com.mellisuga.dao.PublicMessageDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Member;
import com.mellisuga.model.MessageGroup;
import com.mellisuga.model.MessageLog;
import com.mellisuga.model.PublicMessage;

@WebServlet("/QueryMessageServlet")
public class QueryMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QueryMessageServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		Member m = (Member) request.getSession().getAttribute("member");
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			/*
			 // 查询当前公共消息是否是发给我的
			 select * from follow where follower_id=m.getid() and question_id in (
				 select question_id from message_group where id in (
				 	select message_group_id from public_message where message_type='NewAnswerMsg'
				 )
			 )
			 // 如果是,判断是否已经接收该消息
			 select * from message_log where receiver_id=m.getid() and text_id=
			 
			 // 6个月
			 6*30*24*60*60 = 15552000
			 */
			
			int message_count = 0;
			
			// 查询关注的问题有了新答案公共消息
			PublicMessageDAO publicMessageDAO = session.getMapper(PublicMessageDAO.class);
			MessageGroupDAO messageGroupDAO = session.getMapper(MessageGroupDAO.class);
			FollowDAO followDAO = session.getMapper(FollowDAO.class);
			MessageLogDAO messageLogDAO = session.getMapper(MessageLogDAO.class);
			
			// 查询所有小于3个月的公共消息（关注的问题有了新答案）
			List<PublicMessage> publicMessageList = publicMessageDAO.queryPublicMessageByTypeTime();
			if(publicMessageList != null & !publicMessageList.isEmpty()) {
				for(PublicMessage publicMessage : publicMessageList) {
					
					// 查询公共消息组
					MessageGroup messageGroup = messageGroupDAO.queryMessageGroupByid(publicMessage.getMessage_group_id());
					
					// 判断该问题是否关注
					HashMap<String, Object> followMap = new HashMap<String, Object>();
					followMap.put("question_id", messageGroup.getQuestion_id());
					followMap.put("follower_id", m.getId());
					int followFlag = followDAO.isExistInFollow(followMap);
					
					// 判断该公共消息是否已存入消息日志中
					HashMap<String, Object> messageLogMap = new HashMap<String, Object>();
					messageLogMap.put("receiver_id", m.getId());
					messageLogMap.put("message_type", publicMessage.getMessage_type());
					messageLogMap.put("message_group_id", publicMessage.getMessage_group_id());
					int messageLogFlag = messageLogDAO.isExistInMessageLog(messageLogMap);
					
					if(followFlag > 0 && messageLogFlag <= 0) {
						// 当前用户关注了该问题并且该问题有了一个新的答案, 同时用户还没接收消息
						
						// 消息数目加一
						message_count += 1;
						
						// 为该用户新添加一条消息记录
						MessageLog messageLog = new MessageLog();
						messageLog.setSender_id(0);
						messageLog.setReceiver_id(m.getId());
						messageLog.setText_id(publicMessage.getText_id());
						messageLog.setSend_time(publicMessage.getSend_time());
						messageLog.setMessage_type(publicMessage.getMessage_type());
						messageLog.setSender_isdel(0);
						messageLog.setReceiver_isdel(0);
						messageLog.setIs_read(0);
						messageLog.setMessage_group_id(publicMessage.getMessage_group_id());
						
						messageLogDAO.insertMessageLog(messageLog);
						session.commit();
					}else {
						// 当前用户没有关注该问题
						System.out.println("当前用户没有关注该问题");
					}
					
				}
			}

			out.println(message_count);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
