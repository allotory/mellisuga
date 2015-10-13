package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

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

@WebServlet("/UnFollowQuestionServlet")
public class UnFollowQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UnFollowQuestionServlet() {
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
			
			// 删除关注
			HashMap<String, Object> followMap = new HashMap<String, Object>();
			followMap.put("question_id", question_id);
			followMap.put("follower_id", m.getId());
			
			Follow follow = followDAO.queryFollowByQMid(followMap);
			followDAO.deleteFollowById(follow.getId());
			
			// 删除动态
			TrendsDAO trendsDAO = session.getMapper(TrendsDAO.class);
			
			HashMap<String, Object> trendsMap = new HashMap<String, Object>();
			trendsMap.put("trends_id", question_id);
			trendsMap.put("trends_member", m.getId());
			trendsDAO.deleteTrendsByTUid(trendsMap);
			
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
