package com.mellisuga.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.AnswersDAO;
import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.QuestionDAO;
import com.mellisuga.dao.TrendsDAO;
import com.mellisuga.dao.VoteDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Answers;
import com.mellisuga.model.Member;
import com.mellisuga.model.Question;
import com.mellisuga.model.Trends;
import com.mellisuga.model.Vote;

@WebServlet("/VoteAnswerServlet")
public class VoteAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public VoteAnswerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();

		Member m = (Member) request.getSession().getAttribute("member");
		int answer_id = Integer.parseInt(request.getParameter("answer_id"));
		String vote_type = request.getParameter("vote_type");
		String vote_flag = request.getParameter("vote_flag");
		
		SqlSession session = null;
		try {
			session = DBConnection.openDefaultSession();

			// 更新日期
			Date date = new Date();
			String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(date);
			Timestamp now = Timestamp.valueOf(dateFormate);
			
			// 查询答案
			AnswersDAO answersDAO = session.getMapper(AnswersDAO.class);
			Answers answer = new Answers();
			answer.setId(answer_id);
			answer = answersDAO.queryAnswerById(answer);
			
			// 查询问题
			QuestionDAO questionDAO = session.getMapper(QuestionDAO.class);
			Question question = new Question();
			question.setId(answer.getQuestion_id());
			question = questionDAO.queryQuestionById(question);
			
			// 插入or更新删除投票表
			VoteDAO voteDAO = session.getMapper(VoteDAO.class);
			MemberDAO memberDAO = session.getMapper(MemberDAO.class);
			TrendsDAO trendsDAO = session.getMapper(TrendsDAO.class);
			
			if("newvote".equals(vote_flag)) {
				// 第一次正常投票

				// 判断是否投的是赞同票
				if("up".equals(vote_type)) {
					
					// 更新回答用户获得赞数 +1
					Member member = memberDAO.queryMemberByID(answer.getAuthor_id());
					member.setApprove_num(member.getApprove_num() + 1);
					memberDAO.updateMember(member);
					
					// 更新动态表
					Trends trends = new Trends();
					trends.setTrends_id(answer.getId());
					// 动态类型—— FollowingQuestion, AgreeWithThisAnswer, AnswerThisQuestion, AskAQuestion
					trends.setTrends_type("AgreeWithThisAnswer");
					trends.setP_trends_id(answer.getQuestion_id());
					trends.setP_trends_type(question.getQuestion_title());
					trends.setTrends_time(now);
					trends.setTrends_member(m.getId());
					trendsDAO.insertTrends(trends);
				}

				// 添加投票
				Vote vote = new Vote();
				vote.setAnswer_id(answer.getId());
				vote.setVoter_id(m.getId());
				vote.setVote_type(vote_type);
				voteDAO.insertVote(vote);
				session.commit();
				
				out.print("投票成功!");
			} else if("cancelupvote".equals(vote_flag)) {
				// 投过赞同票，此时不管点赞同还是反对都是取消该赞同
				
				// 更新回答用户获得赞数 -1
				Member member = memberDAO.queryMemberByID(answer.getAuthor_id());
				member.setApprove_num(member.getApprove_num() - 1);
				memberDAO.updateMember(member);
				
				// 查询点赞动态并删除
				HashMap<String, Object> parameterMap = new HashMap<String, Object>();
				parameterMap.put("answer_id", answer.getId());
				parameterMap.put("member_id", m.getId());
				parameterMap.put("trends_type", "AgreeWithThisAnswer");
				
				Trends trends = trendsDAO.queryTrendsByTUid(parameterMap);
				// 删除动态
				trendsDAO.deleteTrendsById(trends.getId());
				
				// 查询投票并删除
				HashMap<String, Object> voteMap = new HashMap<String, Object>();
				voteMap.put("answer_id", answer.getId());
				voteMap.put("voter_id", m.getId());
				Vote vote = voteDAO.queryVoteAUid(voteMap);
				// 删除投票
				voteDAO.deleteVoteById(vote.getId());
				
				session.commit();

				out.print("已取消支持!");
			} else if("canceldownvote".equals(vote_flag)) {
				// 投过反对票, 取消反对
				
				// 查询投票并删除
				HashMap<String, Object> voteMap = new HashMap<String, Object>();
				voteMap.put("answer_id", answer.getId());
				voteMap.put("voter_id", m.getId());
				Vote vote = voteDAO.queryVoteAUid(voteMap);
				// 删除投票
				voteDAO.deleteVoteById(vote.getId());
				
				session.commit();

				out.print("已取消反对!");
			}
			
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
