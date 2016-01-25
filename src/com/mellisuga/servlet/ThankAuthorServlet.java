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

import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.MessageGroupDAO;
import com.mellisuga.dao.MessageLogDAO;
import com.mellisuga.dao.MessageTextDAO;
import com.mellisuga.dao.ThanksDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.MessageGroup;
import com.mellisuga.model.MessageLog;
import com.mellisuga.model.MessageText;
import com.mellisuga.model.Thanks;

@WebServlet("/ThankAuthorServlet")
public class ThankAuthorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ThankAuthorServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		int answer_id = Integer.parseInt(request.getParameter("answer_id"));
		Member m = (Member) request.getSession().getAttribute("member");
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 更新日期
			Date date = new Date();
			String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(date);
			Timestamp now = Timestamp.valueOf(dateFormate);
			
			// 插入感谢作者
			ThanksDAO thanksDAO = session.getMapper(ThanksDAO.class);
			Thanks thanks = new Thanks();
			thanks.setAnswer_id(answer_id);
			thanks.setThanker_id(m.getId());
			thanksDAO.insertThanks(thanks);
			
			// 查询问题
			AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
			Answers answer = new Answers();
			answer.setId(answer_id);
			answer = answersDAO.queryAnswerById(answer);
			
			// 更新用户
			MemberDAO memberDAO = session.getMapper(MemberDAO.class);
			Member member = memberDAO.queryMemberByID(answer.getAuthor_id());
			member.setThank_num(member.getThank_num() + 1);
			memberDAO.updateMember(member);
			
			// 插入消息
			// 消息组
			MessageGroupDAO messageGroupDAO = session.getMapper(MessageGroupDAO.class);
			MessageGroup messageGroup = new MessageGroup();
			messageGroup.setMember_id(m.getId());
			messageGroup.setQuestion_id(answer.getQuestion_id());
			messageGroup.setAnswer_id(answer.getId());
			
			messageGroupDAO.insertMessageGroup(messageGroup);
			session.commit();
			// 查询消息内容
			MessageTextDAO messageTextDAO = session.getMapper(MessageTextDAO.class);
			MessageText messageText = messageTextDAO.queryMessageTextByContent("感谢了你的回答");
			// 插入消息日志
			MessageLogDAO messageLogDAO = session.getMapper(MessageLogDAO.class);
			MessageLog messageLog = new MessageLog();
			messageLog.setSender_id(0);
			messageLog.setReceiver_id(answer.getAuthor_id());
			messageLog.setText_id(messageText.getId());
			messageLog.setSend_time(now);
			messageLog.setRead_time(now);
			messageLog.setMessage_type("ThankYouAnswerMsg");
			messageLog.setSender_isdel(0);
			messageLog.setReceiver_isdel(0);
			messageLog.setIs_read(0);
			messageLog.setMessage_group_id(messageGroup.getId());

			messageLogDAO.insertMessageLog(messageLog);
			
			session.commit();
		} catch(Exception e) {
			e.printStackTrace();
			out.print("error");
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
