package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;

import com.mellisuga.bean.CommentBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.CommentDAO;
import com.mellisuga.dao.MessageGroupDAO;
import com.mellisuga.dao.MessageLogDAO;
import com.mellisuga.dao.MessageTextDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Comment;
import com.mellisuga.model.Member;
import com.mellisuga.model.MessageGroup;
import com.mellisuga.model.MessageLog;
import com.mellisuga.model.MessageText;

@WebServlet("/CommentAnswerServlet")
public class CommentAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommentAnswerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		Member m = (Member) request.getSession().getAttribute("member");
		int answer_id = Integer.parseInt(request.getParameter("answer_id"));
		String content = request.getParameter("comment_content");
		
		// 更新日期
		Date date = new Date();
		String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(date);
		Timestamp now = Timestamp.valueOf(dateFormate);
		
		CommentBean commentBean = new CommentBean();
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 插入答案评论
			CommentDAO commentDAO = session.getMapper(CommentDAO.class);
			Comment comment = new Comment();
			comment.setQuestion_id(0);
			comment.setAnswer_id(answer_id);
			comment.setReviewer_id(m.getId());
			comment.setParent_comment_id(0);
			comment.setContent(content);
			comment.setComment_date(now);
			comment.setFavour_num(0);
			
			commentDAO.insertComment(comment);
			
			// 设置Bean
			commentBean.setComment(comment);
			commentBean.setMember(m);
			
			// 更新答案
			AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
			Answers answers = new Answers();
			answers.setId(answer_id);
			Answers as = answersDAO.queryAnswerById(answers);
			as.setReply_num(as.getReply_num() + 1);
			
			answersDAO.updateAnswer(as);
			
			// 插入消息 - 评论了回答
			// 消息组
			MessageGroupDAO messageGroupDAO = session.getMapper(MessageGroupDAO.class);
			MessageGroup messageGroup = new MessageGroup();
			messageGroup.setMember_id(m.getId());
			messageGroup.setQuestion_id(as.getQuestion_id());
			messageGroup.setAnswer_id(as.getId());
			
			messageGroupDAO.insertMessageGroup(messageGroup);
			session.commit();
			// 查询消息内容
			MessageTextDAO messageTextDAO = session.getMapper(MessageTextDAO.class);
			MessageText messageText = messageTextDAO.queryMessageTextByContent("评论了你的回答");
			// 插入消息日志
			MessageLogDAO messageLogDAO = session.getMapper(MessageLogDAO.class);
			MessageLog messageLog = new MessageLog();
			messageLog.setSender_id(0);
			messageLog.setReceiver_id(as.getAuthor_id());
			messageLog.setText_id(messageText.getId());
			messageLog.setSend_time(now);
			messageLog.setRead_time(now);
			messageLog.setMessage_type("CommentAnswerMsg");
			messageLog.setSender_isdel(0);
			messageLog.setReceiver_isdel(0);
			messageLog.setIs_read(0);
			messageLog.setMessage_group_id(messageGroup.getId());

			messageLogDAO.insertMessageLog(messageLog);
			
			// 提交
			session.commit();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}

		// org.json不能直接将bean转换为json，要使用集合中转
		List<CommentBean> acommentBeanList = new ArrayList<CommentBean>();
		acommentBeanList.add(commentBean);
		
		// 返回评论
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("acommentBeanList", acommentBeanList);
	
		out.print(jsonObject.toString());
	}

}
