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

import com.mellisuga.dao.FollowDAO;
import com.mellisuga.dao.TrendsDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Follow;
import com.mellisuga.model.Member;
import com.mellisuga.model.Trends;

@WebServlet("/FollowQuestionServlet")
public class FollowQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FollowQuestionServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		Member m = (Member) request.getSession().getAttribute("member");
		int question_id = Integer.parseInt(request.getParameter("question_id"));
		
		// 更新日期
		Date date = new Date();
		String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(date);
		Timestamp now = Timestamp.valueOf(dateFormate);
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 添加关注
			FollowDAO followDAO = session.getMapper(FollowDAO.class);
			Follow follow = new Follow();
			follow.setQuestion_id(question_id);
			follow.setFollower_id(m.getId());
			followDAO.insertFollow(follow);
			
			// 添加动态
			TrendsDAO trendsDAO = session.getMapper(TrendsDAO.class);
			Trends trends = new Trends();
			trends.setTrends_id(question_id);
			// 动态类型—— FollowingQuestion, AgreeWithThisAnswer, AnswerThisQuestion, AskAQuestion
			trends.setTrends_type("FollowingQuestion");
			trends.setTrends_time(now);
			trends.setTrends_member(m.getId());
			trendsDAO.insertTrends(trends);
			
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
