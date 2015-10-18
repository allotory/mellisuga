package com.mellisuga.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.FollowDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Follow;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;

@WebServlet("/FollowingServlet")
public class FollowingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FollowingServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Member m = (Member) request.getSession().getAttribute("member");
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 由用户查问题
			FollowDAO followDAO = session.getMapper(FollowDAO.class);
			QuestionDAO questionDAO = session.getMapper(QuestionDAO.class);
			List<Follow> followList = followDAO.queryFollowByMemberId(m.getId());
			List<Question> questionList = new ArrayList<Question>();
			for(Follow f : followList) {
				Question question = new Question();
				question.setId(f.getQuestion_id());
				question = questionDAO.queryQuestionById(question);
				
				questionList.add(question);
			}
			request.setAttribute("questionList", questionList);
			request.getRequestDispatcher("/pages/following.jsp")
					.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
