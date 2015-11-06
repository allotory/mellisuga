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
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;

@WebServlet("/AllQuestionServlet")
public class AllQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AllQuestionServlet() {
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
		
		try {
			
			// 查询当前用户信息
			homeBean.setMember(m);
			
			// 查询所有提问
			List<Question> questionList = questionDAO.queryQuestionByMid(m.getId());
			homeBean.setQuestionList(questionList);
			
			request.setAttribute("homeBean", homeBean);
			request.getRequestDispatcher("/pages/questionlist.jsp")
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
