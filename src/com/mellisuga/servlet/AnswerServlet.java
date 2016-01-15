package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.json.JSONObject;

import com.mellisuga.bean.AnswerBean;
import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.MessageGroupDAO;
import com.mellisuga.dao.MessageTextDAO;
import com.mellisuga.dao.PublicMessageDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.dao.TrendsDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.MessageGroup;
import com.mellisuga.model.MessageText;
import com.mellisuga.model.PublicMessage;
import com.mellisuga.model.Question;
import com.mellisuga.model.Trends;

@WebServlet("/AnswerServlet")
public class AnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AnswerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		Member m = (Member) request.getSession().getAttribute("member");
		String question_id = request.getParameter("question_id");
		String ans = request.getParameter("answers");
		String is_anonymous = request.getParameter("is_anonymous");
		
		// 更新日期
		Date date = new Date();
		String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(date);
		Timestamp now = Timestamp.valueOf(dateFormate);
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();
			
			// 查询问题
			QuestionDAO questionDAO = session.getMapper(QuestionDAO.class);
			Question question = new Question();
			question.setId(Integer.parseInt(question_id));
			Question q = questionDAO.queryQuestionById(question);
			
			// 更新问题信息
			q.setAnswers_num(q.getAnswers_num() + 1);
			q.setFollowers_num(q.getFollowers_num() + 1);
			q.setLast_updated(now);
			q.setScan_num(q.getScan_num() + 1);
			questionDAO.updateQuestion(q);
			
			// 插入答案
			AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
			Answers answers = new Answers();
			answers.setQuestion_id(q.getId());
			answers.setAuthor_id(m.getId());
			answers.setAnswers(ans);
			answers.setAnswer_date(now);
			answers.setReply_num(0);
			answers.setIs_top_answer(0);
			if(is_anonymous != null) {
				answers.setIs_anonymous(0);
			} else {
				answers.setIs_anonymous(1);
			}
			answersDAO.insertAnswer(answers);
			
			session.commit();

			// TODO 同一个问题每个人只能回答一次！！！
			// TODO 同一个问题每个人只能回答一次！！！
			// TODO 同一个问题每个人只能回答一次！！！
			// TODO 同一个问题每个人只能回答一次！！！
			// TODO 同一个问题每个人只能回答一次！！！
			
			// 查询答案
			//answers = answersDAO.queryAnswerByQUid(answers);
			//System.out.println("=="+answers.getId());
			
			// 更新用户信息（回答数）
			MemberDAO memberDAO = session.getMapper(MemberDAO.class);
			m.setAnswer_num(m.getAnswer_num() + 1);
			memberDAO.updateMember(m);
			
			// 更新动态
			TrendsDAO trendsDAO = session.getMapper(TrendsDAO.class);
			Trends trends = new Trends();
			trends.setTrends_id(answers.getId());
			// 动态类型—— FollowingQuestion, AgreeWithThisAnswer, AnswerThisQuestion, AskAQuestion
			trends.setTrends_type("AnswerThisQuestion");
			trends.setP_trends_id(q.getId());
			trends.setP_trends_type(q.getQuestion_title());
			trends.setTrends_time(now);
			trends.setTrends_member(m.getId());
			trendsDAO.insertTrends(trends);
			
			// 更新消息
			// 1. 插入消息
			MessageTextDAO messageTextDAO = session.getMapper(MessageTextDAO.class);
			MessageText  messageText = new MessageText();
			messageText.setContent("你关注的问题有了一个新回答");
			messageTextDAO.insertMessageText(messageText);
			// 2. 插入用户组
			MessageGroupDAO messageGroupDAO = session.getMapper(MessageGroupDAO.class);
			MessageGroup messageGroup = new MessageGroup();
			messageGroup.setMember_id(m.getId());		// 回答用户
			messageGroup.setQuestion_id(q.getId());		// 被回答问题
			messageGroup.setAnswer_id(answers.getId());	// 答案
			messageGroupDAO.insertMessageGroup(messageGroup);
			session.commit();
			// 3. 插入公共消息
			PublicMessageDAO publicMessageDAO = session.getMapper(PublicMessageDAO.class);
			PublicMessage publicMessage = new PublicMessage();
			System.out.println(messageText.getId());
			publicMessage.setText_id(messageText.getId());
			publicMessage.setSend_time(now);
			publicMessage.setMessage_type("NewAnswerMsg");
			System.out.println(messageGroup.getId());
			publicMessage.setMessage_group_id(messageGroup.getId());
			publicMessageDAO.insertPublicMessage(publicMessage);
			session.commit();
			
			// 重新查询用户信息
			m = memberDAO.queryMemberByUserID(m.getId());
			request.getSession().setAttribute("member", m);
			
			// 设置答案bean
			AnswerBean answerBean = new AnswerBean();
			answerBean.setAnswer(answers);
			answerBean.setMember(m);
			
			List<AnswerBean> answerBeanList = new ArrayList<AnswerBean>();
			answerBeanList.add(answerBean);
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("answerBeanList", answerBeanList);
			
			// 返回评论json
			//System.out.println(jsonObject.toString());
			out.print(jsonObject.toString());
			
		} catch(Exception e) {
			out.println("Post answer error!");
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
	}

}
