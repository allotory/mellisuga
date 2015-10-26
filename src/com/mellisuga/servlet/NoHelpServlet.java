package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.NoHelpDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Member;
import com.mellisuga.model.NoHelp;

@WebServlet("/NoHelpServlet")
public class NoHelpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoHelpServlet() {
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
			
			// 插入答案没有帮助
			NoHelpDAO noHelpDAO = session.getMapper(NoHelpDAO.class);
			NoHelp noHelp = new NoHelp();
			noHelp.setAnswer_id(answer_id);
			noHelp.setMember_id(m.getId());
			noHelpDAO.insertNoHelp(noHelp);
			
			session.commit();
		} catch(Exception e) {
			e.printStackTrace();
			out.print("addnohelperror");
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
