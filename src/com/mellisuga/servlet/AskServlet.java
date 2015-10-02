package com.mellisuga.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.bean.AnswerBean;
import com.mellisuga.bean.QuestionBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.dao.TagDAO;
import com.mellisuga.dao.TrendsDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;
import com.mellisuga.model.Tag;
import com.mellisuga.model.Trends;

@WebServlet("/AskServlet")
public class AskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AskServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		Member m = (Member) request.getSession().getAttribute("member");

		String question_title = request.getParameter("question_title");
		String question_content = request.getParameter("question_original_content");
		String tags = request.getParameter("tags");
		String is_anonymous = request.getParameter("is_anonymous");

		// 更新日期
		Date date = new Date();
		String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(date);
		Timestamp now = Timestamp.valueOf(dateFormate);

		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();

			// 添加问题
			QuestionDAO questionDAO = session.getMapper(QuestionDAO.class);

			Question question = new Question();
			question.setQuestion_title(question_title);
			question.setQuestion_content(question_content);
			question.setAnswers_num(0);
			question.setFollowers_num(0);
			question.setLast_updated(now);
			question.setScan_num(0);
			question.setReply_num(0);
			if (is_anonymous != null) {
				question.setIs_anonymous(0);
			} else {
				question.setIs_anonymous(1);
			}
			question.setMember_id(m.getId());
			questionDAO.insertQuestion(question);

			session.commit();

			// 查询问题
			Question q = questionDAO.queryQuestionByQUid(question);

			// 添加话题
			TagDAO tagDAO = session.getMapper(TagDAO.class);
			if (tags != null) {
				String[] tag_array = tags.split(",");
				for (int i = 0; i < tag_array.length; i++) {
					Tag tag = new Tag();
					tag.setTagname(tag_array[i]);
					tag.setQuestion_id(q.getId());
					tagDAO.insertTag(tag);
				}
			}
			
			// 添加动态
			TrendsDAO trendsDAO = session.getMapper(TrendsDAO.class);
			Trends trends = new Trends();
			trends.setTrends_id(q.getId());
			// 动态类型—— FollowingQuestion, AgreeWithThisAnswer, AnswerThisQuestion, AskAQuestion
			trends.setTrends_type("AskAQuestion");
			trends.setTrends_time(now);
			trends.setTrends_member(m.getId());
			trendsDAO.insertTrends(trends);

			// 添加日志
			// TODO 数据库表想简单了～
			// TODO 数据库表想简单了～
			// TODO 数据库表想简单了～
			// TODO 数据库表想简单了～
			
			// 更新用户信息（提问数）
			MemberDAO memberDAO = session.getMapper(MemberDAO.class);
			m.setAnswer_num(m.getAnswer_num() + 1);
			memberDAO.updateMember(m);
			
			session.commit();
			
			// 重新查询用户信息
			m = memberDAO.queryMemberByUserID(m.getId());
			
			// 查询标签
			List<Tag> tagList = tagDAO.queryTagByQuestionId(q);
			
			// 查询答案
			AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
			List<Answers> answersList = answersDAO.queryAnswerByQuestionId(q);
			List<AnswerBean> answerBeanList = new ArrayList<AnswerBean>();
			if(answersList != null && !answersList.isEmpty()) {
				// 由答案查询答案作者
				for(Answers a : answersList) {
					AnswerBean answerBean = new AnswerBean();
					Member member = memberDAO.queryMemberByUserID(a.getAuthor_id());
					answerBean.setAnswer(a);
					answerBean.setMember(member);
					answerBeanList.add(answerBean);
				}
			}
			
			QuestionBean questionBean = new QuestionBean();
			questionBean.setQuestion(q);
			questionBean.setTagList(tagList);
			questionBean.setAnswerBeanList(answerBeanList);
			
			request.setAttribute("questionBean", questionBean);
			request.getSession().setAttribute("member", m);
			request.getRequestDispatcher("/pages/question.jsp")
					.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}

	}

}
