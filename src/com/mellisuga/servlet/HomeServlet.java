package com.mellisuga.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.bean.HomeBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Member m = (Member) request.getSession().getAttribute("member");
		
		HomeBean homeBean = new HomeBean();
		
		SqlSession session = DBConnection.openDefaultSession();
		QuestionDAO questionDAO = session.getMapper(QuestionDAO.class);
		AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
		
		try {
			
			// 查询当前用户信息
			homeBean.setMember(m);
			
			// 查询所有提问
			List<Question> questionList = questionDAO.query3QuestionByMid(m.getId());
			homeBean.setQuestionList(questionList);
			System.out.println("ahahahahahahahahahahahahah");
			System.out.println(questionList.size());
			for(Question q : questionList) {
				System.out.println(q.getQuestion_title());
			}
			
			// 查询所有回答
			List<Answers> answersList = answersDAO.query3AnswersByAuthorId(m.getId());
			homeBean.setAnswersList(answersList);
			
			// 查询动态
			

			request.setAttribute("homeBean", homeBean);
			request.getRequestDispatcher("/pages/home.jsp")
					.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
