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
import com.mellisuga.dao.CommentDAO;
import com.mellisuga.dao.MessageGroupDAO;
import com.mellisuga.dao.MessageLogDAO;
import com.mellisuga.dao.MessageTextDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Comment;
import com.mellisuga.model.Member;
import com.mellisuga.model.MessageGroup;
import com.mellisuga.model.MessageLog;
import com.mellisuga.model.MessageText;
import com.mellisuga.model.Question;

@WebServlet("/CommentQuestionServlet")
public class CommentQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommentQuestionServlet() {
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
		int question_id = Integer.parseInt(request.getParameter("question_id"));
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
			
			// 插入问题评论
			CommentDAO commentDAO = session.getMapper(CommentDAO.class);
			Comment comment = new Comment();
			comment.setQuestion_id(question_id);
			comment.setAnswer_id(0);
			comment.setReviewer_id(m.getId());
			comment.setParent_comment_id(0);
			comment.setContent(content);
			comment.setComment_date(now);
			comment.setFavour_num(0);
			
			commentDAO.insertComment(comment);
			
			// 更新问题
			QuestionDAO questionDAO = session.getMapper(QuestionDAO.class);
			Question question = new Question();
			question.setId(question_id);
			Question q = questionDAO.queryQuestionById(question);
			q.setReply_num(q.getReply_num() + 1);
			
			questionDAO.updateQuestion(q);
			
			// 插入消息 -- 评论了问题
			// 消息组
			MessageGroupDAO messageGroupDAO = session.getMapper(MessageGroupDAO.class);
			MessageGroup messageGroup = new MessageGroup();
			messageGroup.setMember_id(m.getId());
			messageGroup.setQuestion_id(q.getId());
			
			messageGroupDAO.insertMessageGroup(messageGroup);
			session.commit();
			// 查询消息内容
			MessageTextDAO messageTextDAO = session.getMapper(MessageTextDAO.class);
			MessageText messageText = messageTextDAO.queryMessageTextByContent("评论了你的问题");
			// 插入消息日志
			MessageLogDAO messageLogDAO = session.getMapper(MessageLogDAO.class);
			MessageLog messageLog = new MessageLog();
			messageLog.setSender_id(0);
			messageLog.setReceiver_id(q.getMember_id());
			messageLog.setText_id(messageText.getId());
			messageLog.setSend_time(now);
			messageLog.setRead_time(now);
			messageLog.setMessage_type("CommentQuestionMsg");
			messageLog.setSender_isdel(0);
			messageLog.setReceiver_isdel(0);
			messageLog.setIs_read(0);
			messageLog.setMessage_group_id(messageGroup.getId());

			messageLogDAO.insertMessageLog(messageLog);
			
			// 提交
			session.commit();
			
			commentBean.setComment(comment);
			commentBean.setMember(m);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
		
		List<CommentBean> commentBeanList = new ArrayList<CommentBean>();
		commentBeanList.add(commentBean);
		
		// 返回评论
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("commentBeanList", commentBeanList);
		
		out.print(jsonObject);
	}

}
