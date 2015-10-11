package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.FollowDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Follow;
import com.mellisuga.model.Member;

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
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			FollowDAO followDAO = session.getMapper(FollowDAO.class);
			Follow follow = new Follow();
			follow.setQuestion_id(question_id);
			follow.setFollower_id(m.getId());
			followDAO.insertFollow(follow);
			
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
