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
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Comment;
import com.mellisuga.model.Member;

@WebServlet("/CommentAnswerServlet")
public class CommentAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommentAnswerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
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

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
