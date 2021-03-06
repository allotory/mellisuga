package com.mellisuga.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.bean.AnswerBean;
import com.mellisuga.bean.HomeBean;
import com.mellisuga.bean.TrendsBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.dao.RelationshipDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.function.TrendsFunc;
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
		int id = Integer.parseInt(request.getParameter("id"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		HomeBean homeBean = new HomeBean();
		
		SqlSession session = DBConnection.openDefaultSession();
		MemberDAO memberDAO = session.getMapper(MemberDAO.class);
		QuestionDAO questionDAO = session.getMapper(QuestionDAO.class);
		AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
		
		try {
			
			// 查询当前用户信息
			Member member = memberDAO.queryMemberByID(id);
			homeBean.setMember(member);
			
			// 查询所有提问
			List<Question> questionList = questionDAO.query3QuestionByMid(m.getId());
			homeBean.setQuestionList(questionList);
			
			// 查询所有回答
			List<AnswerBean> answerBeanList = new ArrayList<AnswerBean>();
			List<Answers> answersList = answersDAO.query3AnswersByAuthorId(m.getId());
			for(Answers a : answersList) {
				// 查询答案对应问题
				Question question = new Question();
				question.setId(a.getQuestion_id());
				question = questionDAO.queryQuestionById(question);
				
				// 设置答案及问题bean
				AnswerBean answerBean = new AnswerBean();
				answerBean.setAnswer(a);
				answerBean.setQuestion(question);
				
				answerBeanList.add(answerBean);
			}
			homeBean.setAnswerBeanList(answerBeanList);
			
			// 判断是否已关注
			if(id != m.getId()) {
				// 不是当前用户自己
				RelationshipDAO relationshipDAO = session.getMapper(RelationshipDAO.class);
				HashMap<String, Object> parameterMap = new HashMap<String, Object>();
				parameterMap.put("member_id", m.getId());
				parameterMap.put("followee_id", id);
				boolean isFollowing = relationshipDAO.isExistInRelationship(parameterMap) > 0 ? true : false;
				
				homeBean.setFollowing(isFollowing);
			}
			
			// 查询动态
			List<TrendsBean> trendsBeanList = new TrendsFunc()
				.getTrends(session, m, "specificUser", pageNum);
			homeBean.setTrendsBeanList(trendsBeanList);
			
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
