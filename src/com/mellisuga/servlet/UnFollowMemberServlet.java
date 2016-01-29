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

import com.mellisuga.dao.RelationshipDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Member;

@WebServlet("/UnFollowMemberServlet")
public class UnFollowMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UnFollowMemberServlet() {
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
			HashMap<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("member_id", m.getId());
			parameterMap.put("followee_id", followee_id);
			relationshipDAO.deleteRelationshipById(parameterMap);
			
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
