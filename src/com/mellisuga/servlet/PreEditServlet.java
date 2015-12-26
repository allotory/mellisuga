package com.mellisuga.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;

@WebServlet("/PreEditServlet")
public class PreEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PreEditServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		

		int answer_id = Integer.parseInt(request.getParameter("answer_id"));
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 插入答案
			AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
			Answers answers = new Answers();
			answers.setId(answer_id);
			answers = answersDAO.queryAnswerById(answers);
			
			request.setAttribute("answer", answers);
			request.getRequestDispatcher("/pages/edit.jsp")
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
