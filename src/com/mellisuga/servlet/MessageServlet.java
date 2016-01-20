package com.mellisuga.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.bean.MessageBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.MessageGroupDAO;
import com.mellisuga.dao.MessageLogDAO;
import com.mellisuga.dao.MessageTextDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.MessageGroup;
import com.mellisuga.model.MessageLog;
import com.mellisuga.model.MessageText;
import com.mellisuga.model.Question;

@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MessageServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Member m = (Member) request.getSession().getAttribute("member");
		
		SqlSession session = null;
		
		try {
			session = DBConnection.openDefaultSession();
			
			MessageLogDAO messageLogDAO = session.getMapper(MessageLogDAO.class);
			MessageGroupDAO messageGroupDAO = session.getMapper(MessageGroupDAO.class);
			MessageTextDAO messageTextDAO = session.getMapper(MessageTextDAO.class);
			QuestionDAO questionDAO = session.getMapper(QuestionDAO.class);
			AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
			MemberDAO memberDAO = session.getMapper(MemberDAO.class);
			
			// 查询所有未读消息
			HashMap<String, Object> messageLogMap = new HashMap<String, Object>();
			messageLogMap.put("receiver_id", m.getId());
			messageLogMap.put("is_read", 0);
			List<MessageLog> messageLogList = messageLogDAO.queryMessageLogByUnread(messageLogMap);
			
			List<MessageBean> messageBeanList = new ArrayList<MessageBean>();
			
			if(messageLogList != null && !messageLogList.isEmpty()) {
				for(MessageLog messageLog : messageLogList ) {

					MessageBean messageBean = new MessageBean();
					
					if(messageLog.getMessage_type().equals("NewAnswerMsg")) {
						// 关注的问题有了一个新回答
						// 查询消息
						MessageText messageText = messageTextDAO.queryMessageTextById(messageLog.getText_id());
						// 查询相关组
						MessageGroup messageGroup = messageGroupDAO.queryMessageGroupByid(messageLog.getMessage_group_id());
						// 查询相关问题
						Question question = new Question();
						question.setId(messageGroup.getQuestion_id());
						question = questionDAO.queryQuestionById(question);
						// 查询相关答案
						Answers answers = new Answers();
						answers.setId(messageGroup.getAnswer_id());
						answers = answersDAO.queryAnswerById(answers);
						// 查询提交答案用户
						Member member = memberDAO.queryMemberByID(messageGroup.getMember_id());
						
						messageBean.setMessageLog(messageLog);
						messageBean.setMessageText(messageText);
						messageBean.setQuestion(question);
						messageBean.setAnswers(answers);
						messageBean.setMember(member);
						
						messageBeanList.add(messageBean);
					}
				}
			}
			
			request.setAttribute("messageBeanList", messageBeanList);
			request.getRequestDispatcher("/pages/notifications.jsp")
					.forward(request, response);
			
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
