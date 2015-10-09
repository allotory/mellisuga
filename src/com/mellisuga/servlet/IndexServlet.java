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

import com.mellisuga.bean.TrendsBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.dao.TrendsDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;
import com.mellisuga.model.Trends;

@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IndexServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		SqlSession defaultSession = null;

		try {
			defaultSession = DBConnection.openDefaultSession();

			// 首页动态查询
			TrendsDAO trendsDAO = defaultSession.getMapper(TrendsDAO.class);
			AnswersDAO answersDAO = defaultSession.getMapper(AnswersDAO.class);
			MemberDAO memberDAO = defaultSession.getMapper(MemberDAO.class);
			List<Trends> trendsList = trendsDAO.queryAllTrends();
			List<TrendsBean> trendsBeanList = new ArrayList<TrendsBean>();
			
			QuestionDAO questionDAO = defaultSession.getMapper(QuestionDAO.class);
			
			if(trendsList != null) {
				for(Trends t : trendsList) {
					
					TrendsBean trendsBean = null;
					
					// 动态类型—— FollowingQuestion, AgreeWithThisAnswer, AnswerThisQuestion, AskAQuestion
					if("FollowingQuestion".equals(t.getTrends_type())) {
						// 1：关注该问题
						
					} else if("AgreeWithThisAnswer".equals(t.getTrends_type())) {
						// 2：赞同该回答
						trendsBean = new TrendsBean();
						trendsBean.setTrends(t);
						
						// 查询回答问题信息
						Question question = new Question();
						question.setId(t.getP_trends_id());
						Question q = questionDAO.queryQuestionById(question);
						trendsBean.setQuestion(q);
						
						// 查询答案
						Answers answers = new Answers();
						answers.setId(t.getTrends_id());
						answers = answersDAO.queryAnswerById(answers);
						trendsBean.setAnswer(answers);

						// 查询回答用户
						Member m = memberDAO.queryMemberByUserID(answers.getAuthor_id());
						trendsBean.setMember(m);
						
						// 查询点赞用户
						Member tm = memberDAO.queryMemberByID(t.getTrends_member());
						trendsBean.setTrendsMember(tm);
						
					} else if("AnswerThisQuestion".equals(t.getTrends_type())) {
						// 3：回答了该问题
						trendsBean = new TrendsBean();
						trendsBean.setTrends(t);
						
						// 查询回答问题信息
						Question question = new Question();
						question.setId(t.getP_trends_id());
						Question q = questionDAO.queryQuestionById(question);
						trendsBean.setQuestion(q);
						
						// 查询答案
						Answers answers = new Answers();
						answers.setId(t.getTrends_id());
						answers = answersDAO.queryAnswerById(answers);
						trendsBean.setAnswer(answers);
						
						// 查询回答用户
						Member m = memberDAO.queryMemberByID(answers.getAuthor_id());
						trendsBean.setMember(m);
						
					} else if("AskAQuestion".equals(t.getTrends_type())) {
						// 4：提了一个问题
						trendsBean = new TrendsBean();
						trendsBean.setTrends(t);
						
						// 查询所提问题信息
						Question question = new Question();
						question.setId(t.getTrends_id());
						Question q = questionDAO.queryQuestionById(question);
						trendsBean.setQuestion(q);

						// 提问用户
						Member m = memberDAO.queryMemberByID(q.getMember_id());
						trendsBean.setMember(m);
					}
					trendsBeanList.add(trendsBean);
				}
			}
			
			request.setAttribute("trendsBeanList", trendsBeanList);
			request.getRequestDispatcher("/pages/index.jsp")
					.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(defaultSession);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
